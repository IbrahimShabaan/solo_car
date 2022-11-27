import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:min_id/min_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:solo_car/Customer/bussniess_logic/customer_state.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../Shared/components.dart';
import '../../Shared/constants.dart';
import '../../admin/presentation/screens/layout/admin_layout_screen.dart';
import '../../cache_helper.dart';
import '../data/model/complaints_and_suggestion.dart';
import '../data/model/customer_model.dart';
import '../profile/customer_profile.dart';
import '../screens/HomePage.dart';


class CustomerCubit extends Cubit<CustomerStates> {
  CustomerCubit() : super(CustomerInitialState());

  static CustomerCubit get(context) => BlocProvider.of(context);

  // ############ Customer SignUp ############
  Future<void> customerSignUp({
    required String email,
    required String password,
    required String confirmpassword,
    required String firstName,
    required String lastName,
    required String phone,
    required String userName,
    required BuildContext context,
  }) async {
    try {
      emit(CustomerSignUpLoadingState());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        await insertCustomer(
          docId: value.user!.uid,
          firstName: firstName,
          lastName: lastName,

          email: email,
          phone: phone,
          userName: userName,

        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: AppItems.customText(
              'The password provided is too weak.',
              fontSize: 12.sp,
            ),
          ),
        );
        emit(CustomerSignUpErrorState(e.toString()));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: AppItems.customText(
              'The account already exists for that email.',
              fontSize: 12.sp,
            ),
          ),
        );
        emit(CustomerSignUpErrorState(e.toString()));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AppItems.customText(
            e.toString(),
            fontSize: 12.sp,
          ),
        ),
      );
      emit(CustomerSignUpErrorState(e.toString()));
    }
  }

  // ############ Customer SignIn ############
  Future customerSignIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      emit(CustomerSignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
          .then((value) {

        if(email !='aymananwar@gmail.com' && password !='123456123456'){
          navigateAndFinish(
              context, HomePage(id: ConstText.customerId));
          print('successes');

        } else {


        navigateAndFinish(
            context, AdminLayoutScreen(id: '',));
        print('not successes');
        }
        ConstText.customerId = value.user!.uid;

      });


      emit(CustomerSignInSuccessState(ConstText.customerId));


    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: AppItems.customText(
              'No user found for that email.',
              fontSize: 12.sp,
            ),
          ),
        );
        emit(CustomerSignInErrorState(error.toString()));
      } else if (error.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: AppItems.customText(
              'Wrong password provided for that user.',
              fontSize: 12.sp,
            ),
          ),
        );
        emit(CustomerSignInErrorState(error.toString()));
      }
    }
  }

  // ############ Get Customer Data ############
  CustomerModel? customerModel;
  Future getCustomerData({
    required String id,
  }) async {
    emit(GetCustomerLoadingState());
    await FirebaseFirestore.instance
        .collection('Customers')
        .doc(id)
        .get()
        .then((value) {
      customerModel = CustomerModel.fromJson(value.data()!);
      emit(GetCustomerSuccessState());
    }).catchError((error) {
      emit(GetCustomerErrorState(error.toString()));
    });
  }

  // ############ Customer SignOut ############
  Future<void> customerSignOut() async {
    emit(CustomerSignOutLoadingState());
    FirebaseAuth.instance.signOut().then((value) {
      emit(CustomerSignOutSuccessState());
    }).catchError((error) {
      emit(CustomerSignOutErrorState(error.toString()));
    });
  }

  // ############ Insert Customer ############
  Future<void> insertCustomer({
    required String docId,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String userName,

  }) async {
    await uploadProfileImage(docId);
    emit(InsertCustomerLoadingState());
    CustomerModel customerModel = CustomerModel(
      docId: docId,
      token: '',
      email: email,
      phone: phone,
      lastName: lastName,

      userName: userName,
      firstName: firstName,



    );
    await FirebaseFirestore.instance
        .collection('Customers')
        .doc(docId)
        .set(customerModel.toJson())
        .then((value) {
      if (profileImageUrl.isNotEmpty) {
        setProfileImage(id: docId, urlImage: profileImageUrl);
      }
      emit(InsertCustomerSuccessState(docId));
    }).catchError((error) {
      emit(InsertCustomerErrorState(error.toString()));
    });
  }

  // ############ Update Customer ############
  Future<void> updateCustomer({
    required String id,
    required String firstName,
    required String lastName,
    required String phone,

  }) async {
    emit(UpdateCustomerLoadingState());
    if (profileImage != null) {
      await uploadProfileImage(id);
    }
    FirebaseFirestore.instance.collection('Customers').doc(id).set({
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
         }, SetOptions(merge: true)).then((value) async {
      if (profileImageUrl.isNotEmpty) {
        setProfileImage(id: id, urlImage: profileImageUrl);
      }
      emit(UpdateCustomerSuccessState());
    }).catchError((error) {
      emit(UpdateCustomerErrorState(error.toString()));
    });
  }

  // ===================== Set Customer Device Token =====================
  Future<void> setCustomerToken({
    required String id,
    required String token,
  }) async {
    emit(SetCustomerTokenLoadingState());
    await FirebaseFirestore.instance.collection('Customers').doc(id).set({
      'token': token,
    }, SetOptions(merge: true)).then((value) async {
      emit(SetCustomerTokenSuccessState());
    }).catchError((error) {
      emit(SetCustomerTokenErrorState(error.toString()));
    });
  }

  // ===================== Reset Password =====================
  Future<void> resetPassword(String email) async {
    emit(CustomerResetPasswordLoadingState());
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) async {
      emit(CustomerResetPasswordSuccessState());
    }).catchError((error) {
      emit(CustomerResetPasswordErrorState(error.toString()));
    });
  }







// ####### Handling Picked Image To Storage #######
  File? profileImage;
  var imageSource = ImageSource.gallery;
  Future pickedImage(imageSource) async {
    emit(PickedProfileImageLoadingState());
    final pickedFile = await ImagePicker().pickImage(
      source: imageSource,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(PickedProfileImageSuccessState());
    } else {
      // ignore: avoid_print
      print('no image select');
      emit(PickedProfileImageErrorState());
    }
  }

  // ####### Handling Upload Image To Storage #######
  String profileImageUrl = '';
  Future<void> uploadProfileImage(id) async {
    emit(UploadProfileImageLoadingState());
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
        'Customers/$id/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) async {
      profileImageUrl = await value.ref.getDownloadURL();
      emit(UploadProfileImageSuccessState());
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
    });
  }



  // ####### Handling Set Image To Fire store #######
  Future<void> setProfileImage({
    required String id,
    required String urlImage,
  }) async {
    emit(SetProfileImageLoadingState());
    await FirebaseFirestore.instance
        .collection('Customers')
        .doc(id)
        .set({'image': urlImage}, SetOptions(merge: true)).then((value) {
      emit(SetProfileImageSuccessState());
    }).catchError((error) {
      emit(SetProfileImageErrorState(error.toString()));
    });
  }

  // ####### Handling Delete Image From Storage #######
  Future<void> deleteProfileImageFromStorage(String url) async {
    // emit(UploadProfileImageLoadingState());
    await firebase_storage.FirebaseStorage.instance
        .refFromURL(url)
        .delete()
        .then((value) async {
      // emit(UploadProfileImageSuccessState());
    }).catchError((error) {
      // emit(UploadProfileImageErrorState());
    });
  }

  void changeCloseImage() {
    profileImage = null;
    emit(CloseImageChangeState());
  }

  void customerToken(String id) async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.getAPNSToken().then((token) async {
        await setCustomerToken(id: id, token: '$token');
      });
    } else {
      await FirebaseMessaging.instance.getToken().then((token) async {
        await setCustomerToken(id: id, token: '$token');
      });
    }
  }

  // ####### Handling delete Customer  #######
  Future<void> deleteCustomer(String id) async {
    emit(DeleteCustomerLoadingState());
    FirebaseFirestore.instance
        .collection('Customers')
        .doc(id)
        .delete()
        .then((value) {
      emit(DeleteCustomerSuccessState());
    }).catchError((error) {
      emit(DeleteCustomerErrorState(error.toString()));
    });
  }

  // ========= Handling Delete Profile Image From Storage =========
  Future<void> deleteProfileImage(String url) async {
    await firebase_storage.FirebaseStorage.instance
        .refFromURL(url)
        .delete()
        .then((value) {})
        .catchError((error) {});
  }

// ################# Handling Bottom Nav Employee #################
  int currentIndex = 0;
  List<BottomNavigationBarItem> CustomerBottomNavItems = [

    const BottomNavigationBarItem(
   backgroundColor:Colors.black,
      label: 'Home',

      icon: Icon(Icons.people_alt,),
    ),
    const BottomNavigationBarItem(
      label: 'Profile',
      backgroundColor:Colors.black,
      icon: Icon(Icons.content_paste_sharp,),
    ),


  ];

  List<Widget> screens = [
     HomePage(id: '',),
    const CustomerProfile(),


  ];
  void CustomerChangeBottomNavBar(int index) {
    currentIndex = index;
    emit(CustomerBottomNavChangeState());
  }


  ComplaintsAndSuggestionModel? complaintsAndSuggestionModel;
  Future<void> insertComplaintsAndSuggestion({
    required String carName,
    required String modelCar,
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
  }) async {
    var id = MinId.getId();
    ComplaintsAndSuggestionModel model = ComplaintsAndSuggestionModel(
      id: id,

      carName: carName,
      modelCar: modelCar,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      // type: enquiryTypeValue,
      // createdAt: Timestamp.fromDate(DateTime.now()),

    );
    emit(InsertComplaintsAndSuggestionLoadingState());
    await FirebaseFirestore.instance
        .collection('Owners form')
        .doc('Customers')
        .collection('Owners form')
        .doc(id)
        .set(model.toJson())
        .then((value) {
      emit(InsertComplaintsAndSuggestionSuccessState());
    }).catchError((error) {
      emit(InsertComplaintsAndSuggestionErrorState(error.toString()));
    });
  }






}
