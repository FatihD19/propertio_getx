import 'dart:convert';
import 'dart:io';

class UpdateProfilRequestModel {
  String? email;
  String? password;
  String? fullName;
  String? phone;
  String? address;
  String? province;
  String? city;
  File?
      pictureProfileFile; // Tambahkan parameter picture_profile_file bertipe File

  UpdateProfilRequestModel({
    this.email,
    this.password,
    this.fullName,
    this.phone,
    this.address,
    this.province,
    this.city,
    this.pictureProfileFile, // Tambahkan parameter picture_profile_file
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "email": email,
      "password": password,
      "full_name": fullName,
      "phone": phone,
      "address": address,
      "province": province,
      "city": city,
    };
    // Jika ada foto profil yang dipilih, konversi ke base64 dan tambahkan ke JSON
    if (pictureProfileFile != null) {
      List<int> imageBytes = pictureProfileFile!.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      data["picture_profile_file"] = base64Image;
    }
    return data;
  }
}

class ResetPasswordRequestModel {
  String? oldPassword;
  String? passwordConfirmation;
  String? password;

  ResetPasswordRequestModel({
    this.oldPassword,
    this.passwordConfirmation,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "old_password": oldPassword,
        "password_confirmation": passwordConfirmation,
        "password": password,
      };
}
