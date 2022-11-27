// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
//
// import '../owner_model.dart';
// import 'owner_states.dart';
//
// class ProductOwnerCubit extends Cubit<ProductOwnerStates> {
//   ProductOwnerCubit() : super(ProductOwnerInitialState());
//
//   static ProductOwnerCubit get(context) => BlocProvider.of(context);
//
//   bool isLoading = false;
//   Future<void> insertCarProduct({
//     required String prodId,
//     required String firstName,
//     required String lastName,
//     required String email,
//     required String carName,
//     required String carModel,
//     required String phone,
//
//   }) async {
//     isLoading = true;
//     emit(InsertProductOwnerLoadingState());
//
//     ProductOwnerModel productownerModel = ProductOwnerModel(
//       prodId: prodId,
//       firstName: firstName,
//       lastName: lastName,
//       phone: phone,
//       email: email,
//       carName: carName,
//       carModel: carModel,
//
//
//
//     );
//     FirebaseFirestore.instance
//         .collection('CarProducts')
//         .doc(prodId)
//         .set(productownerModel.toJson())
//         .then((value) async {
//
//       emit(InsertProductOwnerSuccessState());
//       isLoading = false;
//     }).catchError((error) {
//       emit(InsertProductOwnerErrorState(error.toString()));
//     });
//   }
//
//
//
//
// }
