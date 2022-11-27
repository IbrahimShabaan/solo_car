import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../Customer/screens/custom_product_details.dart';
import '../../../../Customer/widget/widget.dart';
import '../../../../Shared/components.dart';
import 'admin_car_details_view.dart';





class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.yellow),

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
                              navigateTo(context, Admin_Car_Details_view(data: data)),
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

