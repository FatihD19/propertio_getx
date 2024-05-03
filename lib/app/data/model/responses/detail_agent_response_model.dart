import 'package:propertio_getx/app/data/model/pagination_model.dart';
import 'package:propertio_getx/app/data/model/properti_model.dart';

class DetailAgentResponseModel {
  String? status;
  String? message;
  DataDetailAgent? data;

  DetailAgentResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DetailAgentResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailAgentResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : DataDetailAgent.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DataDetailAgent {
  String? accountId;
  String? email;
  String? fullName;
  String? phone;
  String? pictureProfileFile;
  dynamic imageCover;
  String? address;
  String? city;
  String? province;
  String? description;
  String? website;
  String? areaSpecialist;
  List<dynamic>? languages;
  List<Specialist>? specialists;
  Properties? properties;

  DataDetailAgent({
    this.accountId,
    this.email,
    this.fullName,
    this.phone,
    this.pictureProfileFile,
    this.imageCover,
    this.address,
    this.city,
    this.province,
    this.description,
    this.website,
    this.areaSpecialist,
    this.languages,
    this.specialists,
    this.properties,
  });

  factory DataDetailAgent.fromJson(Map<String, dynamic> json) =>
      DataDetailAgent(
        accountId: json["account_id"],
        email: json["email"],
        fullName: json["full_name"],
        phone: json["phone"],
        pictureProfileFile: json["picture_profile_file"],
        imageCover: json["image_cover"],
        address: json["address"],
        city: json["city"],
        province: json["province"],
        description: json["description"],
        website: json["website"],
        areaSpecialist: json["area_specialist"],
        languages: json["languages"] == null
            ? []
            : List<dynamic>.from(json["languages"]!.map((x) => x)),
        specialists: json["specialists"] == null
            ? []
            : List<Specialist>.from(
                json["specialists"]!.map((x) => Specialist.fromJson(x))),
        properties: json["properties"] == null
            ? null
            : Properties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "email": email,
        "full_name": fullName,
        "phone": phone,
        "picture_profile_file": pictureProfileFile,
        "image_cover": imageCover,
        "address": address,
        "city": city,
        "province": province,
        "description": description,
        "website": website,
        "area_specialist": areaSpecialist,
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x)),
        "specialists": specialists == null
            ? []
            : List<dynamic>.from(specialists!.map((x) => x.toJson())),
        "properties": properties?.toJson(),
      };
}

class Properties {
  List<PropertiModel>? data;
  Pagination? pagination;

  Properties({
    this.data,
    this.pagination,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        data: json["data"] == null
            ? []
            : List<PropertiModel>.from(
                json["data"]!.map((x) => PropertiModel.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Specialist {
  String? name;
  String? icon;

  Specialist({
    this.name,
    this.icon,
  });

  factory Specialist.fromJson(Map<String, dynamic> json) => Specialist(
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
      };
}
