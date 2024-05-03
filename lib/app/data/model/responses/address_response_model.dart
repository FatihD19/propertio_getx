// class ProvinceResponseModel {
//   String? id;
//   String? name;

//   ProvinceResponseModel({
//     this.id,
//     this.name,
//   });

//   factory ProvinceResponseModel.fromJson(Map<String, dynamic> json) =>
//       ProvinceResponseModel(
//         id: json["id"],
//         name: json["name"],
//       );

//   // factory ProvinceResponseModel.fromJson(String str) =>
//   //     ProvinceResponseModel.fromMap(json.decode(str));

//   // factory ProvinceResponseModel.fromMap(Map<String, dynamic> json) =>
//   //     ProvinceResponseModel(
//   //       id: json["id"],
//   //       name: json["name"],
//   //     );
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };
// }

import 'dart:convert';

class ProvinceResponseModel {
  String? id;
  String? name;

  ProvinceResponseModel({
    this.id,
    this.name,
  });
  List<ProvinceResponseModel> provinceResponseModelFromJson(String str) =>
      List<ProvinceResponseModel>.from(
          json.decode(str).map((x) => ProvinceResponseModel.fromJson(x)));

  String provinceResponseModelToJson(List<ProvinceResponseModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory ProvinceResponseModel.fromJson(Map<String, dynamic> json) =>
      ProvinceResponseModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class CitiesResponseModel {
  String? id;
  String? provinceId;
  String? name;

  CitiesResponseModel({
    this.id,
    this.provinceId,
    this.name,
  });

  factory CitiesResponseModel.fromJson(Map<String, dynamic> json) =>
      CitiesResponseModel(
        id: json["id"],
        provinceId: json["province_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_id": provinceId,
        "name": name,
      };
}
