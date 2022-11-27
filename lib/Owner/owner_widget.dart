import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';


import '../../Shared/components.dart';
import '../../Shared/constants.dart';

class OwnerItems {
  static Widget customCarProductsItems({
    void Function()? onTap,
    required Map<String, dynamic> data,
  }) =>
      Padding(
        padding:  EdgeInsets.all(8.sp),
        child: InkWell(
          onTap: onTap,
          splashColor: ConstColors.kPrimaryColor.withOpacity(0.3),
          highlightColor: ConstColors.kPrimaryColor.withOpacity(0.1),
          child: Container(


            decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(color: Colors.yellow, spreadRadius: 2.sp),
              ],
              borderRadius: BorderRadius.circular(14.sp,),
            ),
            child: Row(
              children: [

                SizedBox(width: 10.sp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 3.sp),
                    AppItems.customText(
                      data['carName'],
                      fontSize: 16.sp,
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w800,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8.sp),
                    AppItems.customText(
                      'Model: ${data['carModel']}',
                      fontSize: 13.sp,
                      fontColor: Colors.white,
                    ),
                    SizedBox(height: 8.sp),
                    AppItems.customText(
                      'Car Name: ${data['carName']}',
                      fontSize: 13.sp,
                      fontColor: Colors.white,
                    ),
                    SizedBox(height: 8.sp),
                    AppItems.customText(
                      'First Name: ${data['firstName']}',
                      fontSize: 13.sp,
                      fontColor: Colors.white,
                    ),
                    SizedBox(height: 8.sp),
                    AppItems.customText(
                      'Last Name: ${data['lastName']}',
                      fontSize: 13.sp,
                      fontColor: Colors.white,
                    ),
                    SizedBox(height: 8.sp),
                    AppItems.customText(
                      'Phone: ${data['phone']}',
                      fontSize: 13.sp,
                      fontColor: Colors.white,
                    ),
                    SizedBox(height: 8.sp),
                    AppItems.customText(
                      'email: ${data['email']}',
                      fontSize: 13.sp,
                      maxLines: 2,
                      fontColor: Colors.white,
                    ),
                    SizedBox(height: 8.sp),

                  ],
                ),
              ],
            ),
          ),
        ),

      );



}