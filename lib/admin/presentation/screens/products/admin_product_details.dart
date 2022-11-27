import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import '../../../../Shared/components.dart';
import '../../widgets/widgets.dart';


class AdminProductDetails extends StatelessWidget {
  const AdminProductDetails({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: AppButtons.customButtonBack(context),
        title: const Text('Car Details',style: TextStyle(color: Colors.yellow),),
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
                    height: 120.sp,
                    width: 120.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(data['prodImage']),
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
                'Car Price:${data['carPrice']}',
                fontSize: 12.sp,
                fontColor: Colors.yellow,
              ),
              SizedBox(height: 10.sp),


            ],
          ),
        ),
      ),
    );
  }
}
