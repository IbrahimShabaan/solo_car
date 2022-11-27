import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:solo_car/Customer/screens/HomePage.dart';

import '../../Shared/components.dart';
import '../../Shared/constants.dart';
import '../../cache_helper.dart';
import '../bussniess_logic/customer_cubit.dart';
import '../bussniess_logic/customer_state.dart';
import '../widget/widget.dart';
import 'customer_edit_profile.dart';

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerCubit, CustomerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CustomerCubit.get(context);
        var data = cubit.customerModel;
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: const Text('My Profile',style: TextStyle(color: Colors.yellow),),
            actions: [
              IconButton(
                icon: Icon(Icons.edit, size: 22.sp, color: Colors.yellow),
                onPressed: () async {
                  navigateTo(
                      context, CustomerEditProfile(customerModel: data!));
                },
              ),
              IconButton(
                icon: Icon(Icons.logout,
                    size: 22.sp, color: Colors.yellow),
                onPressed: () async {
                  navigateAndFinish(context,  HomePage(id: '',));
                  await cubit.customerSignOut();
                  await CacheHelper.removeData(key: 'userData');
                  cubit.customerModel = null;
                  await FirebaseMessaging.instance.deleteToken();
                },
              ),
            ],
          ),
          body: cubit.customerModel != null
              ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: ListView(
              children: [
                SizedBox(height: 10.sp),
                CircleAvatar(
                  radius: 57.sp,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                      radius: 55.sp,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(data!.image!)),
                ),
                SizedBox(height: 30.sp),
                CustomerItemss.customProfileDataItem(
                    text: 'UserName: ${data.userName}'),
                SizedBox(height: 10.sp),
                CustomerItemss.customProfileDataItem(
                    text: 'FirstName: ${data.firstName}'),
                SizedBox(height: 10.sp),
                CustomerItemss.customProfileDataItem(
                    text: 'LastName: ${data.lastName}'),
                SizedBox(height: 10.sp),
                CustomerItemss.customProfileDataItem(
                    text: 'Email: ${data.email}'),
                SizedBox(height: 10.sp),
                CustomerItemss.customProfileDataItem(
                    text: 'Phone: ${data.phone}'),
                SizedBox(height: 10.sp),

              ],
            ),
          )
              : AppItems.customIndicator(),
        );
      },
    );
  }
}
