class LoginResponseModel {
  String? status;
  String? message;
  DataLogin? data;

  LoginResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : DataLogin.fromJson(json["data"]),
      );
}

class DataLogin {
  UserModel? user;
  String? token;

  DataLogin({
    this.user,
    this.token,
  });

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
        token: json["token"],
      );
}

class UserModel {
  int? id;
  String? email;
  String? password;
  String? accountId;
  String? fullName;
  String? role;
  dynamic pictureProfileFile;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.accountId,
    this.fullName,
    this.role,
    this.pictureProfileFile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        accountId: json["account_id"],
        fullName: json["full_name"],
        role: json["role"],
        pictureProfileFile: json["picture_profile_file"],
      );
  UserModel copyWith({
    int? id,
    String? email,
    String? password,
    String? accountId,
    String? fullName,
    String? role,
    dynamic pictureProfileFile,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      accountId: accountId ?? this.accountId,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      pictureProfileFile: pictureProfileFile ?? this.pictureProfileFile,
    );
  }
}
