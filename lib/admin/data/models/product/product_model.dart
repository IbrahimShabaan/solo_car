class ProductModel {
  String? prodId;
  String? prodImage;
  String? prodNationality;
  String? carPrice;
  String? carName;
  String? carModel;

  ProductModel({
    this.prodId,
    this.prodImage,
    this.carPrice,

    this.prodNationality,
    this.carModel,
    this.carName,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    prodId = json['prodId'];
    prodImage = json['prodImage'];
    prodNationality = json['prodNationality'];
    carName = json['carName'];
    carPrice = json['carPrice'];
    carModel = json['carModel'];
  }

  Map<String, dynamic> toJson() => {
        'prodId': prodId,
        'prodImage': prodImage,
        'prodNationality': prodNationality,
        'carName': carName,
        'carPrice': carPrice,
        'carModel': carModel,
      };
}
