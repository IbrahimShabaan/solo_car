import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Customer/bussniess_logic/customer_cubit.dart';
import '../Customer/bussniess_logic/customer_state.dart';
import '../Customer/screens/car_rented_screen.dart';
import '../Customer/screens/signup_screen.dart';
import '../Shared/components.dart';
import '../Shared/constants.dart';
import '../cache_helper.dart';
import 'owner_or_rental_screen.dart';

class Login_Screen extends StatelessWidget {
  Login_Screen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = CustomerCubit.get(context);
    return BlocConsumer<CustomerCubit, CustomerStates>(
      listener: (context, state) {
        if (state is CustomerSignInSuccessState) {
          cubit.getCustomerData(id: state.id);
          // navigateAndFinish(context, CarRentedScreen(
          //     // id: state.id
          // ));
          CacheHelper.setListOfData('userData',
              id: state.id, section: 'Customer');
          cubit.customerToken(state.id);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body:
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 120.sp, left: 8.sp, right: 8.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppItems.customAppLogo(),
                  SizedBox(height: 30.sp),
                  Text(
                    'Sign in to your account',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppItems.customTextField(
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
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
                        SizedBox(height: 10.sp),
                        AppItems.customTextField(
                          hintText: 'Password',
                          obscureText: true,

                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is required';
                            } else if (value.length < 6) {
                              return 'weak password';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 40.sp),
                        BuildCondition(
                          condition: state is! CustomerSignInLoadingState,
                          fallback: (context) => AppItems.customIndicator(),
                          builder: (context) => AppButtons.customElevatedButton(
                            text: 'Login',
                            fontSize: 14.sp,

                            elevation: 5,
                            color: ConstColors.kPrimaryColor,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await cubit.customerSignIn(
                                  context: context,
                                  email: emailController.text.trim().toLowerCase(),
                                  password: passwordController.text.trim(),
                                );
                              }
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(fontSize: 11.sp,color: Colors.yellow),
                            ),
                            AppButtons.customTextButton(
                              text: 'Register now',
                              onPressed: (){
                                navigateTo(context,
                                    SignUpScreen());
                              },
                              fontSize: 11.sp,
                              color: Colors.yellow,
                              decoration: TextDecoration.underline,
                              hoverColor:
                              ConstColors.kPrimaryColor.withOpacity(0.3),

                            ),
                          ],
                        ),
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
