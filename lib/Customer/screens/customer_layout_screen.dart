import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/constants.dart';
import '../bussniess_logic/customer_cubit.dart';
import '../bussniess_logic/customer_state.dart';


class CustomerLayoutScreen extends StatelessWidget {
  const CustomerLayoutScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var cubit = CustomerCubit.get(context);
    return BlocConsumer<CustomerCubit, CustomerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 20.sp,
            elevation: 16,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            fixedColor: ConstColors.kPrimaryColor,
            selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp,color:Colors.white),
            unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp,color: Colors.white),
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.CustomerChangeBottomNavBar(index),
            items: cubit.CustomerBottomNavItems,
          ),
        );
      },
    );
  }
}
