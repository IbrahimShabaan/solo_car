import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Customer/bussniess_logic/customer_cubit.dart';
import 'Owner/busniess logic/owner_cubit.dart';
import 'admin/business_logic/admin_cubit.dart';
import 'admin/business_logic/product/product_cubit.dart';

class Solo extends StatelessWidget {
  const Solo({Key? key, required this.startScreen}) : super(key: key);

  final Widget startScreen;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [


        BlocProvider(create: (_) => AdminCubit()),

        BlocProvider(create: (_) => ProductCubit()),
        BlocProvider(create: (_) => CustomerCubit()),
        // BlocProvider(create: (_) => ProductOwnerCubit()),


      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'LACRIMA',
            color: Colors.white,
            debugShowCheckedModeBanner: false,

            home: startScreen,
          );
        },
      ),
    );
  }
}
