import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../Shared/components.dart';
import '../../../business_logic/admin_cubit.dart';
import '../../widgets/widgets.dart';

class CustomerComplaintsScreen extends StatelessWidget {
  const CustomerComplaintsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Complaints'),
        leading: AppButtons.customButtonBack(context),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Complaints And Suggestions')
            .doc('Customers')
            .collection('Complaints And Suggestions')
            .where('type', isEqualTo: 'Complaint')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: AppItems.customIndicator(),
            );
          }
          return ListView(
              children: snapshot.data!.docs.map(
            (DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return AdminItems.customCompAndSugItem(
                data: data,
                onPressed: () async {
                  await AdminCubit.get(context).deleteComplaintsOrSuggestions(
                    id: data['id'],
                    docName: 'Customers',
                  );
                },
              );
            },
          ).toList());
        },
      ),
    );
  }
}
