import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:solo_car/Customer/screens/HomePage.dart';
import 'package:solo_car/Customer/screens/copoun_page.dart';

import '../../Shared/components.dart';
import 'customer_layout_screen.dart';


class CarRentedScreen extends StatelessWidget {
  const CarRentedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(

        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 55.sp,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/car-icon-yell.png',
                  width: 225.sp,
                  height: 105.sp,
                ),
              ],
            ),

          ),
          SizedBox(height: 30.sp,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [


               Text('Car has been rented', style: TextStyle(color: Colors.yellow,

                 fontSize: 15.sp,
               ),)
             ],
          ),
          SizedBox(height: 5.sp,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [


               Text('Successfully', style: TextStyle(color: Colors.white,

                 fontSize: 30.sp,
               ),)
             ],
          ),

          SizedBox(height: 80.sp,),
          AppButtons.customElevatedButton(
            text: 'Confirm',
            elevation: 5,
            textColor: Colors.black,
            width: 180.sp,
            height: 30.sp,
            fontSize: 12,
            borderRadius: 30,
            color: Colors.yellow,
            onPressed: () => navigateTo(context,  CustomerLayoutScreen()),
          ),


        ],
      ),

    );
  }
}
