import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buildcondition/buildcondition.dart';

import '../../../Shared/components.dart';
import '../../../Shared/constants.dart';
import '../../bussniess_logic/customer_cubit.dart';
import '../../bussniess_logic/customer_state.dart';


class CustomerAddCompOrSugScreen extends StatelessWidget {
  CustomerAddCompOrSugScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final carNameController = TextEditingController();
  final modelCarController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerCubit, CustomerStates>(
      listener: (context, state) {
        if (state is InsertComplaintsAndSuggestionSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: AppItems.customText(
                'Form Was Sent Successfully',
                fontSize: 12.sp,
                fontColor: Colors.yellow
              ),
            ),
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = CustomerCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            leading: AppButtons.customButtonBack(context),
            title: const Text('Send Owner\'s Form',style: TextStyle(color: Colors.yellow),),
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 10.sp),
                    AppItems.customAppLogo(),
                    SizedBox(height: 30.sp),

                    SizedBox(height: 10.sp),
                    AppItems.customTextField(
                      hintText: 'Car Name',
                      controller: carNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.sp),
                    AppItems.customTextField(
                      hintText: 'Model',
                      controller: modelCarController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.sp),
                    AppItems.customTextField(
                      hintText: 'First Name',
                      controller: firstNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.sp),
                    AppItems.customTextField(
                      hintText: 'Last Name',
                      controller: lastNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.sp),
                    AppItems.customTextField(
                      hintText: 'Phone',
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10.sp),
                    AppItems.customTextField(
                      hintText: 'Email',
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 50.sp),
                    BuildCondition(
                      condition:
                          state is! InsertComplaintsAndSuggestionLoadingState,
                      fallback: (context) => AppItems.customIndicator(),
                      builder: (context) => AppButtons.customElevatedButton(
                        text: 'Submit',
                        fontSize: 14.sp,
                        color: ConstColors.kPrimaryColor,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await cubit.insertComplaintsAndSuggestion(
                              carName: carNameController.text,
                              modelCar: modelCarController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                            );
                            // await NotificationServices.sendNotificationToTopic(
                            //   topic: ConstText.cusCompAndSug,
                            //   title: 'Customer ${cubit.enquiryTypeValue}',
                            //   body: contentController.text,
                            // );
                          }
                        },
                      ),
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
