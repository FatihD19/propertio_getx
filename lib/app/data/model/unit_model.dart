class UnitModel {
  String? title;
  String? unitCode;
  String? photo;
  String? price;
  String? bedroom;
  String? bathroom;
  String? surfaceArea;
  String? buildingArea;
  String? stock;

  UnitModel({
    this.title,
    this.unitCode,
    this.photo,
    this.price,
    this.bedroom,
    this.bathroom,
    this.surfaceArea,
    this.buildingArea,
    this.stock,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
        title: json["title"],
        unitCode: json["unit_code"],
        photo: json["photo"],
        price: json["price"],
        bedroom: json["bedroom"],
        bathroom: json["bathroom"],
        surfaceArea: json["surface_area"],
        buildingArea: json["building_area"],
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "unit_code": unitCode,
        "photo": photo,
        "price": price,
        "bedroom": bedroom,
        "bathroom": bathroom,
        "surface_area": surfaceArea,
        "building_area": buildingArea,
        "stock": stock,
      };
}
