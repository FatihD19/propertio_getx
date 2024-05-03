import 'dart:convert';
import 'dart:io';

class RegisterRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? province;
  String? city;
  String? address;
  String? password;
  String? passwordConfirmation;
  String? status;
  File? pictureProfileFile;

  RegisterRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.province,
    this.city,
    this.address,
    this.password,
    this.passwordConfirmation,
    this.status,
    this.pictureProfileFile,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone": phone,
      "province": province,
      "city": city,
      "address": address,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "status": status,
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
