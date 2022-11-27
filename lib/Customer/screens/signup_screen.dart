import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:solo_car/Customer/screens/HomePage.dart';
import 'package:solo_car/Customer/screens/car_rented_screen.dart';


import '../../Shared/components.dart';

import '../../Shared/constants.dart';
import '../bussniess_logic/customer_cubit.dart';
import '../bussniess_logic/customer_state.dart';

import 'otp_screen.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key,  }) : super(key: key);


  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final firstNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var cubit = CustomerCubit.get(context);
    return BlocConsumer<CustomerCubit, CustomerStates>(
      listener: (context, state) {
        if (state is InsertCustomerSuccessState) {
          cubit.getCustomerData(id: state.id);
          navigateAndFinish(context, CarRentedScreen(
              // id: state.id
          ));
          cubit.changeCloseImage();
          cubit.customerToken(state.id);
        }
      },
      builder: (context, state) {
        return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.black,
  leading: AppButtons.customButtonBack(context),
),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.only( left: 8.sp, right: 8.sp),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/car-icon-yell.png',
                    width: 200,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('SIGN UP',
                      style:TextStyle(color: Colors.yellow,fontSize: 26) ,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 57.sp,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 55.sp,
                        backgroundColor: Colors.black,
                        backgroundImage: cubit.profileImage == null
                            ? AssetImage(ConstIcons.placeholder)
                            : FileImage(cubit.profileImage!) as ImageProvider,
                      ),
                    ),
                    Positioned(
                      bottom: 3.sp,
                      right: 2.sp,
                      child: CircleAvatar(
                        radius: 16.sp,
                        backgroundColor: Colors.black,
                        child: IconButton(
                          alignment: Alignment.center,
                          icon: Icon(Icons.camera_alt,
                              size: 18.sp, color: Colors.white),
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                backgroundColor: Colors.black,
                                contentPadding: EdgeInsets.all(2.sp),
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
                                              ConstColors.kPrimaryColor,

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
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),
                Column(
                  children: [
                    AppItems.customTextField(
                      hintText: 'First Name',
                      hintColor: Colors.black,
                      keyboardType: TextInputType.name,
                      controller: firstNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is require';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    AppItems.customTextField(
                      hintText: 'Last Name',
                      hintColor: Colors.black,
                      controller: lastNameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is require';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    AppItems.customTextField(
                      hintText: 'Email',
                      controller: emailController,
                      hintColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        } else if (!value.contains('@')) {
                          return 'invalid email';
                        } else if (!value.contains('.com')) {
                          return 'invalid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    AppItems.customTextField(
                      hintText: 'User Name',
                      hintColor: Colors.black,
                      keyboardType: TextInputType.name,
                      controller: userNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is require';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    AppItems.customTextField(
                      hintText: 'Phone Number',
                      hintColor: Colors.black,
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is require';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10),

                    AppItems.customTextField(
                      hintText: 'Password',

                      hintColor: Colors.black,
                      controller: passwordController,

                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is require';
                        } else if (value.length < 6) {
                          return 'weak password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),


                    AppItems.customTextField(
                      hintText: 'Confirm Password',

                      hintColor: Colors.black,
                      controller: confirmpasswordController,

                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is require';
                        } if (value != passwordController.text) {
                          return 'password not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.sp),


                    BuildCondition(
                      condition: state is! CustomerSignUpLoadingState,
                      fallback: (context) => AppItems.customIndicator(),
                      builder: (context) => AppButtons.customElevatedButton(
                        text: 'Register',
                        elevation: 5,
                        fontSize: 14.sp,
                        color: ConstColors.kPrimaryColor,

                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (cubit.profileImage == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: AppItems.customText(
                                    'must be upload Image',
                                    fontSize: 12.sp,
                                  ),
                                ),
                              );
                            } else {
                              await cubit.customerSignUp(
                                context: context,
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                confirmpassword: confirmpasswordController.text.trim(),
                                firstName: firstNameController.text.trim(),
                                lastName: lastNameController.text.trim(),
                                phone: phoneController.text.trim(),
                                userName: userNameController.text.trim(),

                              );
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10.sp),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
      },
    );


  }
}
