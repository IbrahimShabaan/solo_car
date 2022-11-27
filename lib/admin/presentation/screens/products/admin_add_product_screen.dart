import 'package:sizer/sizer.dart';
import 'package:min_id/min_id.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:buildcondition/buildcondition.dart';

import '../../../../Shared/components.dart';
import '../../../../Shared/constants.dart';
import '../../../business_logic/product/product_cubit.dart';
import '../../../business_logic/product/product_states.dart';


class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final carNameController = TextEditingController();
  final carModelController = TextEditingController();
  final carPriceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var cubit = ProductCubit.get(context);
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        if (state is InsertProductSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: AppItems.customText(
                'Successfully',
                fontSize: 12.sp,
              ),
            ),
          );
          Navigator.pop(context);
          cubit.changeCloseImage();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('Add Car',style: TextStyle(color: Colors.yellow),),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, size: 20.sp,color: Colors.yellow,),
              onPressed: () {
                cubit.changeCloseImage();
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(

            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppItems.customAppLogo(),
                  SizedBox(height: 30.sp),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppItems.customTextField(
                          hintText: 'Car Name',

                          keyboardType: TextInputType.name,
                          controller: carNameController,
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
                        AppItems.customTextField(
                          hintText: 'Price',
                          controller: carPriceController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is require';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.sp),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Select Car:',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.yellow,
                              ),
                            ),
                            Expanded(
                              child: AppButtons.customDropDownButtonFormField(
                                items: cubit.productNationality,
                                hintText: 'Select',

                                hintStyle: TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Field is require';
                                  }
                                  return null;
                                },
                                onChanged: (value) =>
                                    cubit.productNationalityChange(value),

                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10.sp),
                        if (cubit.productImage != null)
                          Stack(
                            children: [
                              Image.file(
                                cubit.productImage!,
                                fit: BoxFit.fitWidth,
                              ),
                              Positioned(
                                right: 1,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                  onPressed: () => cubit.changeCloseImage(),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 10.sp),
                        if (cubit.productImage == null)
                          ElevatedButton.icon(
                            icon: const Icon(Icons.image,color: Colors.black),
                            label: AppItems.customText('Select Image',fontColor: Colors.black),
                            style: TextButton.styleFrom(
                              backgroundColor: ConstColors.kPrimaryColor,

                            ),
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.black,
                                  content: SizedBox(
                                    height: 80.sp,
                                    width: 60.sp,
                                    child: Column(

                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButton.icon(

                                          label: Text(
                                            'Camera',
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                          icon: const Icon(Icons.camera_alt),
                                          style: TextButton.styleFrom(
                                            primary: ConstColors.kPrimaryColor,
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
                                          icon: const Icon(Icons.camera),
                                          style: TextButton.styleFrom(
                                            primary: ConstColors.kPrimaryColor,
                                          ),
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
                              );
                            },
                          ),

                        SizedBox(height: 25.sp),
                        BuildCondition(
                          // condition: state is! InsertProductLoadingState,
                          condition: cubit.isLoading == false,
                          fallback: (context) => AppItems.customIndicator(),
                          builder: (context) => AppButtons.customElevatedButton(
                            text: 'Submit',
                            color: ConstColors.kPrimaryColor,
                            onPressed: () async {
                              final id = MinId.getId();
                              if (formKey.currentState!.validate()) {
                                if (cubit.productImage != null) {
                                  await cubit.insertProduct(
                                    prodId: id,
                                    carName: carNameController.text,
                                    carModel: carModelController.text,
                                    carPrice: carPriceController.text,

                                  );
                                } else {
                                  return ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('must be upload image'),
                                  ));
                                }
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
