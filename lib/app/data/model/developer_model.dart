class DeveloperModel {
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
  dynamic areaSpecialist;

  DeveloperModel({
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
  });

  factory DeveloperModel.fromJson(Map<String, dynamic> json) => DeveloperModel(
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
      };
}
