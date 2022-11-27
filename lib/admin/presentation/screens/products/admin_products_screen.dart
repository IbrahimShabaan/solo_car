import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:solo_car/Customer/screens/HomePage.dart';

import '../../../../Customer/bussniess_logic/customer_cubit.dart';
import '../../../../Customer/bussniess_logic/customer_state.dart';
import '../../../../Shared/components.dart';
import '../../../../Shared/constants.dart';
import '../../../../cache_helper.dart';
import 'admin_add_product_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerCubit, CustomerStates>(
        listener: (context, state) {},
    builder: (context, state) {
      var cubit = CustomerCubit.get(context);
      var data = cubit.customerModel;
return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.black,
    actions: [

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
  backgroundColor: Colors.black,
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppItems.customAppLogo(),



      ],
    ),
  ),
  floatingActionButton: FloatingActionButton(
    child: const Icon(Icons.post_add_rounded,color: Colors.black,),
    backgroundColor: ConstColors.kPrimaryColor,
    onPressed: () => navigateTo(context, AddProductScreen()),
  ),
);

    }
    );
        }

}
