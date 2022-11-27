class CustomerModel {
  String? docId;
  String? token;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? image;
  String? userName;



  CustomerModel({
    this.docId,
    this.token,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.image,
    this.userName,
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    docId = json['docId'];
    token = json['token'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() => {
    'docId': docId,
    'token': token,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phone': phone,
    'image': image,
    'userName': userName,
  };
}
