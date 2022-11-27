// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// import '../Customer/screens/signup_screen.dart';
// import '../Shared/components.dart';
// import '../Shared/constants.dart';
// import 'Owner_SignUp.dart';
// import 'login_screen.dart';
//
// class OwnerOrRentalScreen extends StatelessWidget {
//   const OwnerOrRentalScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// appBar: AppBar(
//   backgroundColor: Colors.black,
//   leading: IconButton(
//     onPressed: (){},
//     icon: Icon(Icons.arrow_back_ios_new),
//   ),
// ),
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding:  EdgeInsets.all(20.sp),
//         child: Column(
//
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/car-icon-yell.png',
//                   width: 150,
//                   height: 100,
//                   fit: BoxFit.fill,
//                 ),
//               ],
//             ),
//             SizedBox(height: 5.sp,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('SIGN UP',
//                   style:TextStyle(color: Colors.yellow,fontSize: 30.sp) ,
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Already have an account?',
//                   style: TextStyle(fontSize: 11.sp,color: Colors.yellow),
//                 ),
//                 AppButtons.customTextButton(
//                   text: 'Login now',
//                   fontSize: 13.sp,
//                   color: ConstColors.kPrimaryColor,
//                   decoration: TextDecoration.underline,
//                   onPressed: () {
//                     navigateTo(context, Login_Screen());
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 30.sp,),
//             AppButtons.customElevatedButton(
//               text: 'Owner',
//               elevation: 5,
//               width: 200.sp,
//               fontSize: 12.sp,
//               borderRadius: 20,
//               color: ConstColors.kPrimaryColor,
//               onPressed: () {
//                 navigateTo(context, Owner_SignUp());
//               },
//             ),
//             SizedBox(height: 20.sp),
//             AppButtons.customElevatedButton(
//               text: 'Rental',
//               elevation: 5,
//               width: 200.sp,
//               fontSize: 12.sp,
//               borderRadius: 20,
//               color: ConstColors.kPrimaryColor,
//               onPressed: () => navigateTo(context,  SignUpScreen()),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
