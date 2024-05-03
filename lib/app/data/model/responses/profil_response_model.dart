class ProfilResponseModel {
  String? status;
  String? message;
  DataProfile? data;

  ProfilResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProfilResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfilResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : DataProfile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DataProfile {
  int? id;
  String? accountId;
  String? email;
  String? status;
  String? role;
  UserData? userData;

  DataProfile({
    this.id,
    this.accountId,
    this.email,
    this.status,
    this.role,
    this.userData,
  });

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        id: json["id"],
        accountId: json["account_id"],
        email: json["email"],
        status: json["status"],
        role: json["role"],
        userData: json["user_data"] == null
            ? null
            : UserData.fromJson(json["user_data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_id": accountId,
        "email": email,
        "status": status,
        "role": role,
        "user_data": userData?.toJson(),
      };
}

class UserData {
  String? fullName;
  String? phone;
  String? address;
  String? city;
  String? province;
  String? pictureProfile;

  UserData({
    this.fullName,
    this.phone,
    this.address,
    this.city,
    this.province,
    this.pictureProfile,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        fullName: json["full_name"],
        phone: json["phone"],
        address: json["address"],
        city: json["city"],
        province: json["province"],
        pictureProfile: json["picture_profile"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone": phone,
        "address": address,
        "city": city,
        "province": province,
        "picture_profile": pictureProfile,
      };
}
