// import 'package:sizer/sizer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:buildcondition/buildcondition.dart';
//
// import '../../Shared/components.dart';
// import '../../Shared/constants.dart';
// import '../../admin/business_logic/admin_cubit.dart';
// import '../../admin/business_logic/admin_states.dart';
// import '../../cache_helper.dart';
// import '../bussniess_logic/customer_cubit.dart';
// import '../bussniess_logic/customer_state.dart';
//
//
// class AdminLogin extends StatelessWidget {
//   AdminLogin({Key? key}) : super(key: key);
//
//   final formKey = GlobalKey<FormState>();
//   final idController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = CustomerCubit.get(context);
//     return BlocConsumer<CustomerCubit, CustomerStates>(
//       listener: (context, state) {
//         // if (state is CustomerSignInSuccessState) {
//         //   cubit.getCustomerData(state.empId);
//         //
//         // }
//         if (state is CustomerSignInSuccessState) {
//           // cubit.getCustomerData(id: state.id);
//           navigateAndFinish(context, AdminLayoutScreen(id: state.id));
//           CacheHelper.setListOfData('userData',
//               id: state.id, section: 'Customer');
//           cubit.customerToken(state.id);
//         }
//       },
//       builder: (context, state) {
//         var cubit = CustomerCubit.get(context);
//         return Scaffold(
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(10.sp),
//               child: Column(
//                 children: [
//                   SizedBox(height: 80.sp),
//                   AppItems.customAppLogo(),
//                   SizedBox(height: 15.sp),
//                   AppItems.customText(
//                     'Login as Lacrima Employee',
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   SizedBox(height: 30.sp),
//                   Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         AppItems.customTextField(
//                           hintText: 'id',
//                           obscureText: true,
//                           keyboardType: TextInputType.text,
//                           controller: idController,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Field is required';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 10.sp),
//                         AppItems.customTextField(
//                           hintText: 'Password',
//                           obscureText: true,
//                           keyboardType: TextInputType.text,
//                           controller: passwordController,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Field is required';
//                             } else if (value.length < 6) {
//                               return 'weak password';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 50.sp),
//                         BuildCondition(
//                           condition: state is! CustomerSignInLoadingState,
//                           fallback: (context) => AppItems.customIndicator(),
//                           builder: (context) => AppButtons.customElevatedButton(
//                             text: 'Login',
//                             color: ConstColors.kPrimaryColor,
//                             fontSize: 14.sp,
//                             elevation: 5,
//                             onPressed: () async {
//                               if (formKey.currentState!.validate()) {
//                                 await cubit.loginValidate(
//                                   context: context,
//                                   empId: idController.text.toLowerCase().trim(),
//                                   password: passwordController.text.trim(),
//                                 );
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 130.sp),
//                   Row(
//                     children: [
//                       const Icon(Icons.info_outline),
//                       SizedBox(width: 5.sp),
//                       Expanded(
//                         child: AppItems.customText(
//                           'if you haven\'t id and password please contact your administrator',
//                           fontSize: 11.sp,
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
