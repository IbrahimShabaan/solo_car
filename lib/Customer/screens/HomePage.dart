import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:solo_car/Customer/screens/search_screen.dart';
import '../../Shared/components.dart';
import '../../Shared/constants.dart';
import '../bussniess_logic/customer_cubit.dart';
import '../widget/widget.dart';
import 'complaints_and_suggestion/customer_complaints_and_suggestion_screen.dart';
import 'custom_product_details.dart';


class HomePage extends StatelessWidget {
    HomePage({Key? key,required this.id}) : super(key: key);

   final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      elevation: 0,
        iconTheme: IconThemeData(color: Colors.yellow),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_search_rounded),
            color: ConstColors.kPrimaryColor,
            onPressed: () => showSearch(
              context: context,
              delegate: SearchScreen(),
            ),
          )
        ],

      ),

      drawer: Drawer(
        backgroundColor: Colors.black,

        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(

              child: Padding(
                padding: EdgeInsets.only(bottom: 20.sp),
                child: Align(child: AppItems.customAppLogo()),
              ),
            ),
            CustomerItemss.customListTileItem(
              title: 'Owner form',
              fontSize: 13.sp,
              iconSize: 20.sp,
              icon: Icons.receipt_long,

              onTap: () {
                navigateTo(context, CustomerAddCompOrSugScreen());
              },
            ),

            // AdminItems.customListTileItem(
            //   title: 'Logout',
            //   fontSize: 13.sp,
            //   iconSize: 20.sp,
            //   icon: Icons.logout,
            //   onTap: () async {
            //     await CacheHelper.removeData(key: 'userData');
            //     await FirebaseMessaging.instance.deleteToken();
            //     navigateAndFinish(context, const StartScreen());
            //   },
            // ),
          ],
        ),
      ),
backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.sp),
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
          child: Column(
            children: [
                 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset('assets/images/App Logo/app_Logo.png',
                  width: 100.sp),
                 SizedBox(width: 20.sp,),
                 SizedBox(
                  width: 170.sp,
              child: Padding(
                    padding:  EdgeInsets.only(
                 top: 25.sp,

                     ),
                   child: TextField(


                       decoration: InputDecoration(

                   border: OutlineInputBorder(
                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
                   borderSide: BorderSide(color: Colors.yellow),
                  ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                   enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                   borderSide: BorderSide(color: Colors.black),

              ),
                 filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.saved_search),
                         hintText: 'Search',
                       contentPadding: EdgeInsets.only(left: 25.sp),
                             ),


                   ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                 height: 10.sp,
                 ),
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                   children: [
               Text('Rent Your Car Easy',
               style: TextStyle(color: Colors.yellow,
                 fontSize: 25),
               ),

                ],

                   ),
                 SizedBox(
                      height: 10.sp,
                          ),
                  Container(
               height: 150.sp,
              width: 270.sp,
               child: Image.asset('assets/images/adver.jpg',fit: BoxFit.fitWidth),
               ),
              SizedBox(height: 5.sp,),
              Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Text('A STORY ABOUT FAIILING IN AND OUT OF LOVE',
              style: TextStyle(color: Colors.yellow,
             fontSize: 12,

            ),),
            ],
            ),

              SizedBox(width: 20.sp,),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Products')
                    .snapshots(),
                builder: (context, snapshot) {
                  var cubit = CustomerCubit.get(context);
                  cubit.getCustomerData(id: id);
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: AppItems.customIndicator());
                  }
                  return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: snapshot.data!.docs.map(
                          (DocumentSnapshot document) {
                        Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                        return CustomerItemss.customProductsItems(

                          data: data,
                          onTap: () =>
                              navigateTo(context, CustomerProductDetails(data: data)),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),





    );

  }
}

// Widget buildStoryItem() =>
//     Container(
//
//       width: 60.0,
//       child: Column(
//         children: [
//           Stack(
//
//             alignment: AlignmentDirectional.bottomEnd,
//             children: [
//             Image.asset('assets/images/large.png',width: 100,),
//
//             ],
//           ),
//
//
//         ],
//       ),
//
//     );

