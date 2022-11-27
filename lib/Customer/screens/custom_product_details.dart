import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import '../../Owner/login_screen.dart';
import '../../Shared/components.dart';

class CustomerProductDetails extends StatelessWidget {
  const CustomerProductDetails({Key? key, required this.data})
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButtons.customElevatedButton(
                      text: 'Rent Now',
                      elevation: 5,
                      textColor: Colors.black,
                      width: 180.sp,
                      height: 40.sp,
                      fontSize: 12,
                      borderRadius: 30,
                      color: Colors.yellow,

                  onPressed: () => navigateTo(context,  Login_Screen()),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
