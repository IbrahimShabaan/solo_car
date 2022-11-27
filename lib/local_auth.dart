
import 'package:flutter/cupertino.dart';

import 'Customer/bussniess_logic/customer_cubit.dart';
import 'Customer/screens/HomePage.dart';
import 'Owner/owner_or_rental_screen.dart';
import 'admin/presentation/screens/layout/admin_layout_screen.dart';
import 'cache_helper.dart';

usersAuth() {
  Widget? startScreen;

  var customerCubit = CustomerCubit();
  List<String> data = CacheHelper.getListOfData(key: 'userData') ?? [];
  if (data.isEmpty) {
    startScreen =  HomePage(id: '',);
  } else {
    String id = data[0];
    String section = data[1];
    if (section == 'Admin') {
      startScreen = const AdminLayoutScreen(id: '',);
    }
    if (section == 'Customer') {
      customerCubit.getCustomerData(id: id);
      startScreen = HomePage(id: '',
          //id: id
      );
    }
  }
  return startScreen;
}
