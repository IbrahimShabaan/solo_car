import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintsAndSuggestionModel {
  String? id;
  // String? type;
  // String? date;
  String? email;
  String? carName;
  String? modelCar;
  String? firstName;
  String? lastName;
  String? phone;
  Timestamp? createdAt;

  ComplaintsAndSuggestionModel({
    this.id,
    // this.type,
    // this.date,

    this.carName,
    this.modelCar,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.createdAt,
  });

  ComplaintsAndSuggestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // type = json['type'];
    // date = json['date'];

    carName = json['carName'];
    modelCar = json['modelCar'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        // 'type': type,
        // 'date': date,

        'carName': carName,
        'modelCar': modelCar,
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
    'email': email,
    'createdAt': createdAt,
      };
}
