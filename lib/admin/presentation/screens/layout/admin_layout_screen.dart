import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Shared/constants.dart';
import '../../../business_logic/admin_cubit.dart';
import '../../../business_logic/admin_states.dart';


class AdminLayoutScreen extends StatelessWidget {
  const AdminLayoutScreen({Key? key, required String id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AdminCubit.get(context);
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            iconSize: 20.sp,
            elevation: 16,
            unselectedItemColor: Colors.white,
            fixedColor: ConstColors.kPrimaryColor,
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp,color: Colors.white),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp,color:Colors.white),
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.adminChangeBottomNavBar(index),
            items: cubit.employeeBottomNavItems,
          ),
        );
      },
    );
  }
}
