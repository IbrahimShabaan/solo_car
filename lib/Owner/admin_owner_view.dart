import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';


import '../../Shared/components.dart';


import 'car_owner_details.dart';
import 'owner_widget.dart';


class Admin_Owner_View extends StatelessWidget {
  const Admin_Owner_View({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,

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

                ],
              ),
              SizedBox(
                height: 10.sp,
              ),




              SizedBox(width: 20.sp,),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('CarProducts')
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
                        return OwnerItems.customCarProductsItems(
                          data: data,
                          onTap: () =>
                              navigateTo(context, CarOwnerDetails(data: data)),
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

