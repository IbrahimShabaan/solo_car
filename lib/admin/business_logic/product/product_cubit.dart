import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:solo_car/admin/business_logic/product/product_states.dart';

import '../../data/models/product/product_model.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  static ProductCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  Future<void> insertProduct({
    required String prodId,
    required String carName,
    required String carModel,
    required String carPrice,


  }) async {
    isLoading = true;
    emit(InsertProductLoadingState());
    await uploadProductImage(prodId);
    ProductModel productModel = ProductModel(
      prodId: prodId,
      prodImage: productImageUrl,

      carName: carName,
      carPrice: carPrice,
      carModel: carModel,
      prodNationality: productNationalityValue,

    );
    FirebaseFirestore.instance
        .collection('Products')
        .doc(prodId)
        .set(productModel.toJson())
        .then((value) async {
      if (productImageUrl.isNotEmpty) {
        await setProductImage(
          productId: prodId,
          productImageUrl: productImageUrl,
        );
      }
      emit(InsertProductSuccessState());
      isLoading = false;
    }).catchError((error) {
      emit(InsertProductErrorState(error.toString()));
    });
  }

  Future<void> updateProduct({
    required String prodId,
    required String carName,
    required String carModel,


  }) async {
    isLoading = true;
    emit(UpdateProductLoadingState());
    if (productImage != null) {
      await uploadProductImage(prodId);
    }
    FirebaseFirestore.instance.collection('Products').doc(prodId).set({
      'prodId': prodId,
      'carModel': carModel,
      'carName': carName,



    }, SetOptions(merge: true)).then((value) async {
      if (productImageUrl.isNotEmpty) {
        await setProductImage(
          productId: prodId,
          productImageUrl: productImageUrl,
        );
      }
      emit(UpdateProductSuccessState());
      isLoading = false;
    }).catchError((error) {
      emit(UpdateProductErrorState(error.toString()));
    });
  }

  Future<void> deleteProduct({
    required String productId,
  }) async {
    emit(DeleteProductLoadingState());
    FirebaseFirestore.instance
        .collection('Products')
        .doc(productId)
        .delete()
        .then((value) {
      emit(DeleteProductSuccessState());
    }).catchError((error) {
      emit(DeleteProductErrorState(error.toString()));
    });
  }

  // ############ Handling Picked Image Employee ############
  File? productImage;
  var imageSource = ImageSource.gallery;
  Future pickedImage(imageSource) async {
    emit(PickedProductImageLoadingState());
    final pickedFile = await ImagePicker().pickImage(
        source: imageSource, preferredCameraDevice: CameraDevice.front);
    if (pickedFile != null) {
      productImage = File(pickedFile.path);
      emit(PickedProductImageSuccessState());
    } else {
      // ignore: avoid_print
      print('no image select');
      emit(PickedProductImageErrorState());
    }
  }

  // ####### Handling Upload Image To Storage #######
  String productImageUrl = '';
  Future<void> uploadProductImage(productId) async {
    emit(UploadProductImageLoadingState());
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'Products/$productId/${Uri.file(productImage!.path).pathSegments.last}')
        .putFile(productImage!)
        .then((value) async {
      productImageUrl = await value.ref.getDownloadURL();
      emit(UploadProductImageSuccessState());
    }).catchError((error) {
      emit(UploadProductImageErrorState(error.toString()));
    });
  }

  // ####### Handling Delete ProductImage Image From Storage #######
  Future<void> deleteProductImageFromStorage(String url) async {
    // emit(UploadAnnouncementImageLoadingState());
    await firebase_storage.FirebaseStorage.instance
        .refFromURL(url)
        .delete()
        .then((value) {
      // emit(UploadAnnouncementImageSuccessState());
    }).catchError((error) {
      // emit(UploadAnnouncementImageErrorState(error.toString()));
    });
  }

  // ####### Handling Set Image To Fire store #######
  Future<void> setProductImage({
    required String productId,
    required String productImageUrl,
  }) async {
    emit(SetProductImageLoadingState());
    await FirebaseFirestore.instance
        .collection('Products')
        .doc(productId)
        .update({'prodImage': productImageUrl}).then((value) {
      emit(SetProductImageSuccessState());
    }).catchError((error) {
      emit(SetProductImageErrorState(error.toString()));
    });
  }

  void changeCloseImage() {
    productImage = null;
    emit(CloseImageChangeState());
  }

  // ############ Handling Request Leave Type ############
  var productNationality = [
    'Nissan sunny',
    'Jordanian',

    'chevrolet optra',
    'hyundai elantra HD ',
    'hyundai elantra CN7 5',
    'hyundai accent rb ',
    'MGzs',
    'KIA crand cerato',
    'KIA sportage',
    'toyota corolla',
    'toyota rush',
    'Nissan qashqai ',
    'hyundai tucson',
    'mercedes S500',
    'mercedes E180',
    'mercedes E200',

  ];
  var productNationalityValue = 'Jordanian';
  void productNationalityChange(value) {
    productNationalityValue = value;
    emit(NationalityProductsState());
  }
}
