import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import '../../../Shared/components.dart';
import '../../../Shared/constants.dart';


class AdminItems {
  static Widget customCompAndSugItem({
    required Map<String, dynamic> data,
    required void Function()? onPressed,
  }) =>
      Container(
        width: double.infinity,
        margin: EdgeInsets.all(8.sp),
        padding: EdgeInsets.all(8.sp),
       
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Car: ${data['carName']}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    'Model: ${data['modelCar']}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    'First Name: ${data['firstName']}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    'Last Name: ${data['lastName']}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    'Mobile: ${data['phone']}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    data['email'],
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Divider(
                    height: 1.sp,
                    thickness: 1.sp,
                    color: Colors.yellow,
                  ),
                  SizedBox(height: 10.sp),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       data['date'],
                  //       style: TextStyle(
                  //         fontSize: 11.sp,
                  //         color: Colors.green,
                  //       ),
                  //     ),
                  //     SizedBox(width: 5.sp),
                  //     Icon(
                  //       Icons.watch_later_outlined,
                  //       size: 12.sp,
                  //       color: Colors.green,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      );

  static Widget customProfileDataItem({
    required String text,
  }) =>
      Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
          color: Colors.grey.shade50.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Text(text, style: TextStyle(fontSize: 14.sp)),
      );






  static Widget customProductsItem({
    required BuildContext context,
    required Map<String, dynamic> data,
    required void Function()? onPressedEdit,
    required void Function()? onPressedDetails,
    required dynamic Function() onPressedYes,
    required dynamic Function() onPressedNo,
  }) =>
      InkWell(
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              content: SizedBox(
                height: 120.sp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      icon: Icon(Icons.edit, size: 18.sp),
                      style: TextButton.styleFrom(
                        primary: ConstColors.kPrimaryColor,
                      ),
                      label: Text(
                        'Edit Car',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      onPressed: onPressedEdit,
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.description_sharp, size: 18.sp),
                      style: TextButton.styleFrom(
                        primary: ConstColors.kPrimaryColor,
                      ),
                      label: Text(
                        'Car Details',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      onPressed: onPressedDetails,
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.delete_forever, size: 18.sp),
                      style: TextButton.styleFrom(
                        primary: ConstColors.kPrimaryColor,
                      ),
                      label: Text(
                        'Delete Car',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog<String>(
                          context: context,
                          builder: (context) => AlertDialog(
                        backgroundColor: Colors.black,
                            content: Text(
                              'Do you want to delete the Car',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.yellow
                              ),
                            ),
                            title: Icon(
                              Icons.warning_rounded,
                              color: Colors.yellow,
                            ),
                            actions: [
                              AppButtons.customTextButton(
                                text: 'Yes',
                                color: ConstColors.kPrimaryColor,
                                fontSize: 14.sp,
                                onPressed: onPressedYes,
                              ),
                              AppButtons.customTextButton(
                                text: 'No',
                                color: ConstColors.kPrimaryColor,
                                fontSize: 14.sp,
                                onPressed: onPressedNo,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        splashColor: ConstColors.kPrimaryColor.withOpacity(0.3),
        highlightColor: ConstColors.kPrimaryColor.withOpacity(0.1),
        child: Container(

          width: double.infinity,
          padding: EdgeInsets.all(8.sp),
          margin: EdgeInsets.all(5.sp),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Row(
            children: [
              Container(
                width: 95.sp,
                height: 90.sp,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: FadeInImage(
                  width: 95.sp,
                  height: 120.sp,
                  fit: BoxFit.fill,
                  image: NetworkImage(data['prodImage']),
                  placeholder: AssetImage(ConstIcons.loading),
                ),
              ),
              SizedBox(width: 8.sp),
              SizedBox(
                width: 160.sp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 8.sp),
                    AppItems.customText(
                      'Car Name: ${data['carName']}',
                      fontSize: 13.sp,
                      fontColor: Colors.yellow,
                    ),
                    SizedBox(height: 8.sp),
                    AppItems.customText(
                      'Car Model: ${data['carModel']}',
                      fontSize: 13.sp,
                      fontColor: Colors.yellow,
                    ),
                    SizedBox(height: 8.sp),
                    AppItems.customText(
                      'Car Price: ${data['carPrice']}',
                      fontSize: 13.sp,
                      fontColor: Colors.yellow,
                    ),
                    Divider(
                      color: Colors.yellow,

                    ),
                  ],
                ),
              ),

            ],
          ),

        ),

      );







  static Widget customerItem({
    required void Function()? onTap,
    required Map<String, dynamic> data,
    required EdgeInsetsGeometry? margin,
  }) =>
      InkWell(
        child: Container(
          height: 80.sp,
          width: double.infinity,
          margin: margin,
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Row(
            children: [
              Container(
                width: 70.sp,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  width: 70.sp,
                  height: 100.sp,
                  image: NetworkImage(data['image']),
                  placeholder: AssetImage(ConstIcons.loading),
                ),
              ),
              SizedBox(width: 5.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppItems.customText(
                    data['userName'],
                    fontSize: 12.sp,
                  ),
                  AppItems.customText(
                    data['companyName'],
                    fontSize: 12.sp,
                  ),
                  SizedBox(
                    width: 190.sp,
                    child: AppItems.customText(
                      data['email'],
                      fontSize: 12.sp,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: onTap,
      );

  static Widget employeeItem({
    required BuildContext context,
    required Map<String, dynamic> data,
    required void Function()? onPressedEdit,
    required void Function()? onPressedSalary,
    required dynamic Function() onPressedYes,
    required dynamic Function() onPressedNo,
  }) =>
      InkWell(
        borderRadius: BorderRadius.circular(10.sp),
        child: Container(
          height: 80.sp,
          width: double.infinity,
          margin: EdgeInsets.all(8.sp),
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Row(
            children: [
              Container(
                width: 70.sp,
                margin: EdgeInsets.only(right: 10.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data['image']),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    data['userName'],
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    data['position'],
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    data['empId'],
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () => showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Enter Actions'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp),
            ),
            actions: [
              AppButtons.customTextButton(
                text: 'Close',
                color: ConstColors.kPrimaryColor,
                fontSize: 14.sp,
                onPressed: () => Navigator.pop(context),
              ),
            ],
            content: SizedBox(
              height: 120.sp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    icon: Icon(Icons.attach_money, size: 18.sp),
                    style: TextButton.styleFrom(
                      primary: ConstColors.kPrimaryColor,
                    ),
                    label: Text(
                      'Insert Salary',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    onPressed: onPressedSalary,
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.edit, size: 18.sp),
                    style: TextButton.styleFrom(
                      primary: ConstColors.kPrimaryColor,
                    ),
                    label: Text(
                      'Edit Employee',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    onPressed: onPressedEdit,
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.delete_forever, size: 18.sp),
                    style: TextButton.styleFrom(
                      primary: ConstColors.kPrimaryColor,
                    ),
                    label: Text(
                      'Delete Employee',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog<String>(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(
                            'Do you want to delete the Employee',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                          title: Icon(
                            Icons.warning_rounded,
                            color: Colors.yellow.shade800,
                          ),
                          actions: [
                            AppButtons.customTextButton(
                              text: 'Yes',
                              color: ConstColors.kPrimaryColor,
                              fontSize: 14.sp,
                              onPressed: onPressedYes,
                            ),
                            AppButtons.customTextButton(
                              text: 'No',
                              color: ConstColors.kPrimaryColor,
                              fontSize: 14.sp,
                              onPressed: onPressedNo,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  static Widget orderItem({
    required BuildContext context,
    required Map<String, dynamic> data,
    required void Function()? onPressedEdit,
    required dynamic Function() onPressedNo,
    required dynamic Function() onPressedYes,
    required void Function()? onPressedDetails,
  }) =>
      InkWell(
        highlightColor: ConstColors.kPrimaryColor.withOpacity(0.1),
        splashColor: ConstColors.kPrimaryColor.withOpacity(0.3),
        child: Container(
          height: 130.sp,
          padding: EdgeInsets.all(4.sp),
          child: Row(
            children: [
              SizedBox(
                width: 196.sp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppItems.customText(
                      'name: ${data['customerName']}',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    AppItems.customText(
                      'Price: ${data['price']}',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        AppItems.customText(
                          'IssueDate: ${data['issueDate']}',
                          fontSize: 12.sp,
                          fontColor: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        Icon(
                          Icons.calendar_month,
                          color: Colors.green,
                          size: 12.sp,
                        ),
                      ],
                    ),
                    AppItems.customText(
                      'Receiving on: ${data['receivingTime']}',
                      fontSize: 12.sp,
                      fontColor: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: 80.sp,
                height: 80.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${data['product'][0]['prodImage']}'),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              content: SizedBox(
                height: 120.sp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      icon: Icon(Icons.edit, size: 18.sp),
                      style: TextButton.styleFrom(
                        primary: ConstColors.kPrimaryColor,
                      ),
                      label: Text(
                        'Edit Order',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      onPressed: onPressedEdit,
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.description_sharp, size: 18.sp),
                      style: TextButton.styleFrom(
                        primary: ConstColors.kPrimaryColor,
                      ),
                      label: Text(
                        'Order Details',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      onPressed: onPressedDetails,
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.delete_forever, size: 18.sp),
                      style: TextButton.styleFrom(
                        primary: ConstColors.kPrimaryColor,
                      ),
                      label: Text(
                        'Delete Order',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog<String>(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(
                              'Do you want to delete the Order',
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                            title: Icon(
                              Icons.warning_rounded,
                              color: Colors.yellow.shade800,
                            ),
                            actions: [
                              AppButtons.customTextButton(
                                text: 'Yes',
                                color: ConstColors.kPrimaryColor,
                                fontSize: 14.sp,
                                onPressed: onPressedYes,
                              ),
                              AppButtons.customTextButton(
                                text: 'No',
                                fontSize: 14.sp,
                                color: ConstColors.kPrimaryColor,
                                onPressed: onPressedNo,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
