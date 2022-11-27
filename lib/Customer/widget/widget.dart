

import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';


import '../../Owner/owner_or_rental_screen.dart';
import '../../Shared/components.dart';
import '../../Shared/constants.dart';

class CustomerItemss {
 static Widget customProductsItems({
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
           Container(

            width: 150.sp,
             height: 80.sp,
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10.sp),
            ),
            child: FadeInImage(
             fit: BoxFit.fitWidth,
             image: NetworkImage(data['prodImage']),
             placeholder: AssetImage(ConstIcons.loading),
            ),
           ),
           SizedBox(width: 10.sp),
           SizedBox(
            width: 100.sp,
            child: Column(
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
               'Price: ${data['carPrice']}',
               fontSize: 13.sp,
               fontColor: Colors.white,
              ),
              SizedBox(height: 8.sp),
          //   AppButtons.customElevatedButton(
          //  text: 'Rent Now',
          //  elevation: 5,
          //  textColor: Colors.black,
          //  width: 120,
          //  height: 30,
          //  fontSize: 12,
          //  borderRadius: 30,
          //  color: Colors.yellow,
          //    onPressed: () => navigateTo(context,  OwnerOrRentalScreen()),
          //
          // ),

             ],
            ),
           ),
          ],
         ),
        ),
       ),

     );
 static Widget customProfileDataItem({
  required String text,
 }) =>
     Container(
      // height: 40.sp,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
       color: Colors.yellow,
       borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Text(text, style: TextStyle(fontSize: 14.sp)),
     );

 static Widget customListTileItem({
  required String title,
  required double fontSize,
  required IconData icon,
  double? iconSize,
  IconData? trailingIcon,
  required Function()? onTap,
 }) =>
     ListTile(

      trailing: Icon(
       trailingIcon,
       size: iconSize,
       color: ConstColors.kPrimaryColor,
      ),
      title: Text(
       title,
       style: TextStyle(
        fontSize: fontSize,
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
       ),
      ),
      leading: Icon(
       icon,
       size: iconSize,
       color: ConstColors.kPrimaryColor,
      ),
      onTap: onTap,
     );


}