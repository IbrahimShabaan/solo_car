import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import '../Shared/components.dart';

class CarOwnerDetails extends StatelessWidget {
  const CarOwnerDetails({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        leading: AppButtons.customButtonBack(context),
        title: const Text('Car Details',style: TextStyle(color: Colors.yellow),),
        backgroundColor: Colors.black,
      ),
backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(width: 10.sp),
              AppItems.customText(
                data['carName'],
                fontSize: 18.sp,
                fontColor: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.sp),
              AppItems.customText(
                'Model: ${data['carModel']}',
                fontSize: 12.sp,
                fontColor: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.sp),
              AppItems.customText(
                'Phone:${data['phone']}',
                fontSize: 12.sp,
                fontColor: Colors.yellow,
              ),
              SizedBox(height: 10.sp),
              AppItems.customText(
                'First Name: ${data['firstName']}',
                fontSize: 12.sp,
                fontColor: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.sp),
              AppItems.customText(
                'Last Name: ${data['lastName']}',
                fontSize: 12.sp,
                fontColor: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.sp),
              AppItems.customText(
                'Email: ${data['email']}',
                fontSize: 12.sp,
                fontColor: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
