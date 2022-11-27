// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';
// import 'package:solo_car/Customer/bussniess_logic/otp_cubit.dart';
// import 'package:solo_car/Customer/screens/photos_screen.dart';
// import 'package:solo_car/Shared/components.dart';
//
// import '../bussniess_logic/otp_state.dart';
// import 'copoun_page.dart';
//
// class OTPScreen extends StatelessWidget {
//    OTPScreen({Key? key}) : super(key: key);
//
//    final otpController = TextEditingController();
//    final phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocConsumer<AuthCubit, AuthState>(
//       listener: (context, state) {
//         if (state is AuthCodeSentState) {
//           navigateAndFinish(context, PhotoScreen(
//             // id: state.id
//           ));
//           // cubit.changeCloseImage();
//           // cubit.customerToken(state.id);
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.black,
//
//           ),
//           backgroundColor: Colors.black,
//           body:
//           Padding(
//             padding:  EdgeInsets.only(top: 25.sp),
//             child: SingleChildScrollView(
//               child: Column(
//
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('OTP CODE',style: TextStyle(color: Colors.yellow,fontSize: 25.sp),),
//                     ],
//                   ),
//                   SizedBox(height:25.sp ,),
//                   Form(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//
//                         Container(
//                           alignment: Alignment.center,
//                           child:  TextFormField(
//                             onChanged: (value) {
//                               if(value.length ==1){
//                                 FocusScope.of(context).nextFocus();
//                               }
//                             },
//                             onSaved: (pin1){},
//                             maxLength: 1,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: '0',
//                               counterText: "",
//                             ),
//                             textAlign: TextAlign.center,
//                             keyboardType: TextInputType.number,
//
//
//
//                             style: TextStyle(
//
//                                 color: Colors.black,fontSize: 35.sp),),
//                           width: 50.sp,
//                           height: 60.sp,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//
//                               color: Colors.white
//                           ),
//
//
//                         ),
//                         SizedBox(width: 8.sp,),
//                         Container(
//                           alignment: Alignment.center,
//                           child:  TextFormField(
//                             onSaved: (pin2){},
//                             onChanged: (value) {
//                               if(value.length ==1){
//                                 FocusScope.of(context).nextFocus();
//                               }
//                             },
//
//                             maxLength: 1,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: '0',
//                               counterText: "",
//                             ),
//                             textAlign: TextAlign.center,
//                             keyboardType: TextInputType.number,
//
//
//
//                             style: TextStyle(
//
//                                 color: Colors.black,fontSize: 35.sp),),
//                           width: 50.sp,
//                           height: 60.sp,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//
//                               color: Colors.white
//                           ),
//
//
//                         ),
//                         SizedBox(width: 8.sp,),
//                         Container(
//                           alignment: Alignment.center,
//                           child:  TextFormField(
//                             onSaved: (pin3){},
//
//                             onChanged: (value) {
//                               if(value.length ==1){
//                                 FocusScope.of(context).nextFocus();
//                               }
//                             },
//                             maxLength: 1,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: '0',
//                               counterText: "",
//                             ),
//                             textAlign: TextAlign.center,
//                             keyboardType: TextInputType.number,
//
//
//
//                             style: TextStyle(
//
//                                 color: Colors.black,fontSize: 35.sp),),
//                           width: 50.sp,
//                           height: 60.sp,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//
//                               color: Colors.white
//                           ),
//
//
//                         ),
//                         SizedBox(width: 8.sp,),
//                         Container(
//                           alignment: Alignment.center,
//                           child:  TextFormField(
//                             onSaved: (pin4){},
//                             onChanged: (value) {
//                               if(value.length ==1){
//                                 FocusScope.of(context).nextFocus();
//                               }
//                             },
//                             maxLength: 1,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: '0',
//                               counterText: "",
//                             ),
//                             textAlign: TextAlign.center,
//                             keyboardType: TextInputType.number,
//
//
//
//                             style: TextStyle(
//
//                                 color: Colors.black,fontSize: 35.sp),),
//                           width: 50.sp,
//                           height: 60.sp,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//
//                               color: Colors.white
//                           ),
//
//
//                         ),
//
//                       ],
//                     ),
//                   ),
//                   SizedBox(height:150.sp ,),
//                   AppButtons.customElevatedButton(
//                     text: 'Confirm',
//                     elevation: 5,
//                     textColor: Colors.black,
//                     width: 150.sp,
//                     height: 30.sp,
//                     fontSize: 12,
//                     borderRadius: 30,
//                     color: Colors.yellow,
//                     onPressed: (){
//                       String phoneNumber = "+91" + phoneController.text;
//                       BlocProvider.of<AuthCubit>(context).sendOTP(phoneNumber);
//                     } ,
//                       // => navigateTo(context,  SearchScreen())
//                   ),
//
//
//
//
//
//
//                 ],
//               ),
//             ),
//           ),
//
//         );
//       },
//     );
//   }
// }
