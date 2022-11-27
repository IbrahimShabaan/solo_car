import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buildcondition/buildcondition.dart';
import '../../../../Shared/components.dart';
import '../../../../Shared/constants.dart';
import '../../../business_logic/product/product_cubit.dart';
import '../../../business_logic/product/product_states.dart';


class AdminEditProductScreen extends StatelessWidget {
  AdminEditProductScreen({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  final formKey = GlobalKey<FormState>();
  final carNameController = TextEditingController();
  final carModelController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    var cubit = ProductCubit.get(context);
    carModelController.text = '${data['carModel']}';
    carNameController.text = '${data['carName']}';

    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        if (state is UpdateProductSuccessState) {
          Navigator.pop(context);
          cubit.changeCloseImage();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: const Text('Edit Product',style: TextStyle(color:Colors.yellow),),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, size: 20.sp,color: Colors.yellow,),
              onPressed: () {
                cubit.changeCloseImage();
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200.sp,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: cubit.productImage == null
                                ? NetworkImage('${data['prodImage']}')
                                : FileImage(cubit.productImage!)
                                    as ImageProvider,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Container(
                          width: 35.sp,
                          height: 35.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.sp),
                            color: Colors.grey.shade300,
                          ),
                          child: IconButton(
                            alignment: Alignment.center,
                            icon: Icon(
                              Icons.camera_alt,
                              size: 18.sp,
                              color: ConstColors.kPrimaryColor,
                            ),
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: SizedBox(
                                    height: 80.sp,
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextButton.icon(
                                            label: Text(
                                              'Camera',
                                              style: TextStyle(fontSize: 16.sp),
                                            ),
                                            icon: Icon(Icons.camera_alt,
                                                size: 18.sp),
                                            style: TextButton.styleFrom(
                                              primary:
                                                  ConstColors.kPrimaryColor,
                                            ),
                                            onPressed: () {
                                              cubit.pickedImage(
                                                  ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                          ),
                                          TextButton.icon(
                                            label: Text(
                                              'Gallery',
                                              style: TextStyle(fontSize: 16.sp),
                                            ),
                                            icon:
                                                Icon(Icons.camera, size: 18.sp),
                                            style: TextButton.styleFrom(
                                                primary:
                                                    ConstColors.kPrimaryColor),
                                            onPressed: () {
                                              cubit.pickedImage(
                                                  ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30.sp),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 10.sp),
                        AppItems.customTextField(
                          hintText: 'Car Name',
                          controller: carNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is require';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.sp),
                        AppItems.customTextField(
                          hintText: 'Model',
                          controller: carModelController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is require';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.sp),

                        SizedBox(height: 30.sp),
                        BuildCondition(
                          condition: cubit.isLoading == false,
                          fallback: (context) => AppItems.customIndicator(),
                          builder: (context) => AppButtons.customElevatedButton(
                            text: 'Submit',
                            fontSize: 13.sp,
                            color: ConstColors.kPrimaryColor,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.updateProduct(
                                  prodId: data['prodId'],

                                  carName: carNameController.text,
                                  carModel: carModelController.text,
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20.sp),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
