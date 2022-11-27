// import 'package:sizer/sizer.dart';
// import 'package:min_id/min_id.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:buildcondition/buildcondition.dart';
//
// import '../Customer/screens/car_rented_screen.dart';
// import '../Shared/components.dart';
// import '../Shared/constants.dart';
// import 'busniess logic/owner_cubit.dart';
// import 'busniess logic/owner_states.dart';
//
// class Owner_SignUp extends StatelessWidget {
//   Owner_SignUp({Key? key}) : super(key: key);
//
//   final formKey = GlobalKey<FormState>();
//   final phoneController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final carNameController = TextEditingController();
//   final carModelController = TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = ProductOwnerCubit.get(context);
//     return BlocConsumer<ProductOwnerCubit, ProductOwnerStates>(
//       listener: (context, state) {
//         if (state is InsertProductOwnerSuccessState) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: AppItems.customText(
//                 'Successfully',
//                 fontSize: 12.sp,
//               ),
//             ),
//           );
//           navigateAndFinish(context, CarRentedScreen());
//
//
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//
//           appBar: AppBar(
//             title: const Text('Add Car',style: TextStyle(color: Colors.yellow),),
// backgroundColor: Colors.black,
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back_ios_new, size: 20.sp,color: Colors.yellow,),
//               onPressed: () {
//
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//           backgroundColor: Colors.black,
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(10.sp),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   AppItems.customAppLogo(),
//                   SizedBox(height: 30.sp),
//                   Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         AppItems.customTextField(
//                           hintText: 'First Name',
//                           keyboardType: TextInputType.name,
//                           controller: firstNameController,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Field is require';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 10.sp),
//                         AppItems.customTextField(
//                           hintText: 'Last Name',
//                           controller: lastNameController,
//                           keyboardType: TextInputType.name,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Field is require';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 10.sp),
//                         AppItems.customTextField(
//                           hintText: 'Email',
//                           keyboardType: TextInputType.emailAddress,
//                           controller: emailController,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Field is require';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 10.sp),
//                         AppItems.customTextField(
//                           hintText: 'Car Name',
//                           keyboardType: TextInputType.emailAddress,
//                           controller: carNameController,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Field is require';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 10.sp),
//                         AppItems.customTextField(
//                           hintText: 'Car Model',
//                           keyboardType: TextInputType.number,
//                           controller: carModelController,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Field is require';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 10.sp),
//                         AppItems.customTextField(
//                           hintText: 'Phone',
//                           keyboardType: TextInputType.number,
//                           controller: phoneController,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Field is require';
//                             }
//                             return null;
//                           },
//                         ),
//
//
//
//
//                         SizedBox(height: 10.sp),
//
//
//
//
//                         SizedBox(height: 25.sp),
//                         BuildCondition(
//                           // condition: state is! InsertProductLoadingState,
//                           condition: cubit.isLoading == false,
//                           fallback: (context) => AppItems.customIndicator(),
//                           builder: (context) => AppButtons.customElevatedButton(
//                             text: 'Submit',
//                             color: ConstColors.kPrimaryColor,
//                             onPressed: () async {
//                               final id = MinId.getId();
//                               if (formKey.currentState!.validate()) {
//
//                                   await cubit.insertCarProduct(
//                                     prodId: id,
//                                     firstName: firstNameController.text,
//                                     lastName: lastNameController.text,
//                                     email: emailController.text,
//                                     carName: carNameController.text,
//                                     carModel: carModelController.text,
//                                     phone: phoneController.text,
//                                   );
//                                 }
//                               }
//
//                           ),
//                         ),
//                         SizedBox(height: 20.sp),
//                       ],
//                     ),
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
