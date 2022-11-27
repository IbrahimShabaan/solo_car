// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'Customer/bussniess_logic/otp_cubit.dart';
// import 'Customer/bussniess_logic/otp_state.dart';
// import 'Customer/screens/photos_screen.dart';
//
// class VerifyPhoneNumberScreen extends StatelessWidget {
//
//   TextEditingController otpController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Verify Phone Number"),
//       ),
//       body: SafeArea(
//         child: ListView(
//           children: [
//
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   TextField(
//                     controller: otpController,
//                     maxLength: 6,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: "6-Digit OTP",
//                         counterText: ""
//                     ),
//                   ),
//
//                   SizedBox(height: 10,),
//
//                   BlocConsumer<AuthCubit, AuthState>(
//                     listener: (context, state) {
//
//                       if(state is AuthLoggedInState) {
//                         Navigator.popUntil(context, (route) => route.isFirst);
//                         Navigator.pushReplacement(context, CupertinoPageRoute(
//                             builder: (context) => PhotoScreen()
//                         ));
//                       }
//                       else if(state is AuthErrorState) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               backgroundColor: Colors.red,
//                               content: Text(state.error),
//                               duration: Duration(milliseconds: 2000),
//                             )
//                         );
//                       }
//
//                     },
//                     builder: (context, state) {
//
//                       if(state is AuthLoadingState) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//
//                       return SizedBox(
//                         width: MediaQuery.of(context).size.width,
//                         child: CupertinoButton(
//                           onPressed: () {
//
//                             BlocProvider.of<AuthCubit>(context).verifyOTP(otpController.text);
//
//                           },
//                           color: Colors.blue,
//                           child: Text("Verify"),
//                         ),
//                       );
//                     },
//                   ),
//
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//////////////////////////////////////////////////////////////////////////


// Padding(
//  padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
//  child: InkWell(
//   onTap: onTap,
//    child: Container(
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//      borderRadius: BorderRadius.circular(10),
//      color: Colors.black,
//      boxShadow: [
//       BoxShadow(color: Colors.yellow, spreadRadius: 3),
//      ],
//     ),
//     child: Row(
//      children: [
//       Container(
//           width: 150.sp,
//           height: 80.sp,
//           child:FadeInImage(
//
//            fit: BoxFit.fitWidth,
//            image: NetworkImage(data['prodImage']),
//            placeholder: AssetImage(ConstIcons.loading),
//           ),
//           // Image.asset('assets/images/bmw.jpg',
//           //
//           //  fit: BoxFit.fitWidth,
//           //
//           //
//           // )
//
//       ),
//
//       Column(
//        children: [
//         Text(data['carName'],style: TextStyle(fontSize: 12.sp,color: Colors.white),),
//
//         Text(data['prodModel'],style: TextStyle(fontSize: 12.sp,color: Colors.white),),
//
//         Text('850 EG',style: TextStyle(fontSize: 15,color: Colors.yellow,
//             fontWeight: FontWeight.bold),),
//
//         AppButtons.customElevatedButton(
//          text: 'Rent Now',
//          elevation: 5,
//          textColor: Colors.black,
//          width: 120,
//          height: 30,
//          fontSize: 12,
//          borderRadius: 30,
//          color: Colors.yellow,
//          onPressed: (){}
//
//         ),
//
//        ],
//       ),
//      ],
//     ),
//
//    ),
//  ),
// );


/////////////////////////////////////////////////////////////////////////////
//
// SafeArea(
// child: Expanded(
// child: SingleChildScrollView(
// scrollDirection: Axis.vertical,
// child: Column(
//
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset('assets/images/App Logo/app_Logo.png',
// width: 100.sp),
// SizedBox(width: 20.sp,),
// SizedBox(
// width: 170.sp,
// child: Padding(
// padding:  EdgeInsets.only(
// top: 25.sp,
//
// ),
// child: TextField(
//
// decoration: InputDecoration(
//
// border: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(35.0)),
// borderSide: BorderSide(color: Colors.yellow),
// ),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(35.0)),
// borderSide: BorderSide(color: Colors.yellow),
// ),
// enabledBorder:OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(35.0)),
// borderSide: BorderSide(color: Colors.black),
//
// ),
// filled: true,
// fillColor: Colors.white,
// suffixIcon: Icon(Icons.saved_search),
// hintText: 'Search',
// contentPadding: EdgeInsets.only(left: 25.sp),
// ),
//
//
// ),
// ),
// ),
// ],
// ),
// SizedBox(
// height: 10.sp,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text('Rent Your Car Easy',
// style: TextStyle(color: Colors.white,
// fontSize: 25),
// ),
//
// ],
//
// ),
// SizedBox(
// height: 10.sp,
// ),
// Container(
// height: 150.sp,
// width: 270.sp,
// child: Image.asset('assets/images/adver.jpg',fit: BoxFit.fitWidth),
// ),
//
// SizedBox(height: 5.sp,),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
//
// Text('A STORY ABOUT FAIILING IN AND OUT OF LOVE',
// style: TextStyle(color: Colors.yellow,
// fontSize: 12,
//
// ),),
// ],
// ),
// // SizedBox(height: 30,),
// // Container(
// //
// //   height: 50.0,
// //   child: ListView.separated(
// //     scrollDirection: Axis.horizontal,
// //     itemBuilder: (context, index) => buildStoryItem(),
// //     separatorBuilder: (context, index) => SizedBox(
// //       width: 20.0,
// //     ),
// //     itemCount: 9,
// //   ),
// // ),
//
// SizedBox(
// height: 15,
// ),
//
//
//
//
//
// ],
// ),
// ),
// ),
// ),









/////////////////////////////////////////////////////////////////////////////////
// Padding(
//  padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
//  child: InkWell(
//   onTap: onTap,
//    child: Container(
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//      borderRadius: BorderRadius.circular(10),
//      color: Colors.black,
//      boxShadow: [
//       BoxShadow(color: Colors.yellow, spreadRadius: 3),
//      ],
//     ),
//     child: Row(
//      children: [
//       Container(
//           width: 150.sp,
//           height: 80.sp,
//           child:FadeInImage(
//
//            fit: BoxFit.fitWidth,
//            image: NetworkImage(data['prodImage']),
//            placeholder: AssetImage(ConstIcons.loading),
//           ),
//           // Image.asset('assets/images/bmw.jpg',
//           //
//           //  fit: BoxFit.fitWidth,
//           //
//           //
//           // )
//
//       ),
//
//       Column(
//        children: [
//         Text(data['carName'],style: TextStyle(fontSize: 12.sp,color: Colors.white),),
//
//         Text(data['prodModel'],style: TextStyle(fontSize: 12.sp,color: Colors.white),),
//
//         Text('850 EG',style: TextStyle(fontSize: 15,color: Colors.yellow,
//             fontWeight: FontWeight.bold),),
//
//         AppButtons.customElevatedButton(
//          text: 'Rent Now',
//          elevation: 5,
//          textColor: Colors.black,
//          width: 120,
//          height: 30,
//          fontSize: 12,
//          borderRadius: 30,
//          color: Colors.yellow,
//          onPressed: (){}
//
//         ),
//
//        ],
//       ),
//      ],
//     ),
//
//    ),
//  ),
// );












/////////////////////////////////////////////////////////////////////////////////