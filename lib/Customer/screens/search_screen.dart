import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Shared/components.dart';
import '../../admin/business_logic/product/product_cubit.dart';
import '../widget/widget.dart';
import 'custom_product_details.dart';


class SearchScreen extends SearchDelegate {
  @override
  SearchScreen()
      : super(
    searchFieldLabel: 'name',
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,

    searchFieldStyle: TextStyle(
      fontSize: 14.sp,
      color: Colors.yellow,

    ),

  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [

      IconButton(

        icon: const Icon(Icons.close,color: Colors.yellow,),

        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = "";
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new,color: Colors.yellow,),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // var cubit = ProductCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('Products')
            .where('carName', isEqualTo: query)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: AppItems.customIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Empty'));
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot doc) {
              Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
              return CustomerItemss.customProductsItems(

                data: data,
                onTap: () =>
                    navigateTo(context, CustomerProductDetails(data: data)),

              );
            }).toList(),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // var cubit = ProductCubit.get(context);
    return Padding(

      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Products')
            .where('carName', isNotEqualTo: 'admin')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: AppItems.customIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Empty'));
          }
          final results = snapshot.data!.docs.where((data) =>
          data['carName']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()) ||
              data['carName']
                  .toString()
                  .toLowerCase()
                  .startsWith(query.toLowerCase()));
          return ListView(

              children: results.map(
                    (DocumentSnapshot document) {
                  Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
                  return CustomerItemss.customProductsItems(

                    data: data,
                    onTap: () =>
                        navigateTo(context, CustomerProductDetails(data: data)),

                  );
                },
              ).toList());
        },
      ),
    );
  }
}
