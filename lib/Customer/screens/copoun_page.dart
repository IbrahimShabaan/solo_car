

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Shared/components.dart';


class CopounScreen extends StatelessWidget {
  CopounScreen({Key? key}) : super(key: key);
int group=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.black,
  elevation: 0,

  leading: IconButton(onPressed: (){},
      icon: Icon(Icons.arrow_back,)),
),
      backgroundColor: Colors.black,
      body: Column(

      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/copoun_logo.png',
            width: 200.sp,
            height: 200.sp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MY COUPONS',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.yellow,fontSize: 24),),


          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search the coupon you want to use ',
            style: TextStyle(color: Colors.white,fontSize: 14),
            ),

          ],
        ),
        SizedBox(height: 10.sp,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.attach_money,color: Colors.white,size: 30.sp,),
    Text('special 25% off',style: TextStyle(color: Colors.yellow,fontSize: 18.sp),),
    Radio(
      groupValue: group,
      fillColor: MaterialStateColor.resolveWith((states) => Colors.yellow),

      onChanged:(T){

      },
      value: 1,


    ),
  ],
),
        SizedBox(height: 3.sp,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.attach_money,color: Colors.white,size: 30.sp,),
            Text('special 25% off',style: TextStyle(color: Colors.yellow,fontSize: 18.sp),),
            Radio(
              groupValue: group,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.yellow),

              onChanged:(T){

              },
              value: 2,


            ),

          ],
        ),
        SizedBox(height: 3.sp,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.attach_money,color: Colors.white,size: 30.sp,),
            Text('special 25% off',style: TextStyle(color: Colors.yellow,fontSize: 18.sp),),
            Radio(
              groupValue: group,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.yellow),

              onChanged:(T){

              },
              value: 3,


            ),

          ],
        ),
        SizedBox(height: 25.sp,),
        AppButtons.customElevatedButton(
          text: 'Add Coupon',
          elevation: 5,
          textColor: Colors.black,
          width: 150.sp,
          height: 30.sp,
          fontSize: 12,
          borderRadius: 30,
          color: Colors.yellow,
          onPressed: () => navigateTo(context,  CopounScreen()),
        ),

      ],
      ),


    );
  }
}

