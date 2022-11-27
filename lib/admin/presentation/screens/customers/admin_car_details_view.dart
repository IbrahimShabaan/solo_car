import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import '../../../../Shared/components.dart';



class Admin_Car_Details_view extends StatelessWidget {
  const Admin_Car_Details_view({Key? key, required this.data})
      : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: AppButtons.customButtonBack(context),
        title: const Text('Product Details',style: TextStyle(color: Colors.yellow),),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200.sp,
                width: double.infinity,
                child: Center(
                  child: Container(
                    height: 150.sp,
                    width: 270.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage('${data['prodImage']}'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.sp),
              AppItems.customText(
                'Car Name: ${data['carName']}',
                fontSize: 18.sp,
                fontColor: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.sp),
              AppItems.customText(
                'Car Model: ${data['carModel']}',
                fontSize: 12.sp,
                fontColor: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.sp),
              AppItems.customText(
                'Car Price: ${data['carPrice']}',
                fontSize: 12.sp,
                fontColor: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 50.sp),



            ],
          ),
        ),
      ),
    );
  }
}
