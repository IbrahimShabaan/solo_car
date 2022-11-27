// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../Customer/bussniess_logic/otp_cubit.dart';
// import '../Customer/bussniess_logic/otp_state.dart';
// import '../test2.dart';
//
// class SignInScreen extends StatelessWidget {
//
//   TextEditingController phoneController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Sign In with Phone"),
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
//                     controller: phoneController,
//
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: "Phone Number",
//                         counterText: ""
//                     ),
//                   ),
//
//
//
//                   BlocConsumer<AuthCubit, AuthState>(
//                     listener: (context, state) {
//
//                       if(state is AuthCodeSentState) {
//                         Navigator.push(context, CupertinoPageRoute(
//                             builder: (context) => VerifyPhoneNumberScreen()
//                         ));
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
//                         child: TextButton(
//                           onPressed: () {
//                             String phoneNumber = "+91" + phoneController.text;
//                             BlocProvider.of<AuthCubit>(context).sendOTP(phoneNumber);
//                           },
//
//                           child: Text("Sign In"),
//                         ),
//                       );
//
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