import 'package:propertio_getx/app/data/model/properti_model.dart';

class AgentModel {
  String? accountId;
  String? email;
  String? role;
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
  List<String>? languages;
  List<PropertyType>? specialists;

  AgentModel({
    this.accountId,
    this.email,
    this.role,
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
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        accountId: json["account_id"],
        email: json["email"],
        role: json["role"],
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
            : List<String>.from(json["languages"]!.map((x) => x)),
        specialists: json["specialists"] == null
            ? []
            : List<PropertyType>.from(
                json["specialists"]!.map((x) => PropertyType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "email": email,
        "role": role,
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
      };
}
