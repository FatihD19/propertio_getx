import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/data/model/request/udpate_profil_request_model.dart';
import 'package:propertio_getx/app/data/model/responses/profil_response_model.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/shared/utils.dart';

class ProfileRemoteDataSource {
  Future<Either<String, ProfilResponseModel>> getProfile() async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = Uri.parse(ApiPath.baseUrl + '/v1/profile');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.get(url, headers: {
      'Authorization': token,
    });

    print(response.body);
    if (response.statusCode == 200) {
      return Right(ProfilResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Server Error');
    }
  }

  // Future<bool> updateProfile(UpdateProfilRequestModel request) async {
  //   var url = Uri.parse(ApiPath.baseUrl + '/v1/profile?_method=PUT');
  //   final token = await AuthLocalDataSource.getToken();
  //   final response = await http.put(url,
  //       headers: {
  //         'Authorization': token,
  //       },
  //       body: request.toJson());

  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  Future<Either<String, ProfilResponseModel>> updateProfile(
      UpdateProfilRequestModel request) async {
    var url = Uri.parse(ApiPath.baseUrl + '/v1/profile?_method=PUT');
    final token = await AuthLocalDataSource.getToken();

    // Buat request multipart
    var requestMultipart = http.MultipartRequest('POST', url);
    requestMultipart.headers['Authorization'] = token;

    // Tambahkan field dari toJson() model
    requestMultipart.fields.addAll(
      request.toJson().map((key, value) => MapEntry(key, value.toString())),
    );
    // Jika ada foto profil yang dipilih, tambahkan ke request multipart
    if (request.pictureProfileFile != null) {
      requestMultipart.files.add(
        http.MultipartFile(
          'picture_profile_file',
          request.pictureProfileFile!.readAsBytes().asStream(),
          request.pictureProfileFile!.lengthSync(),
          filename: request.pictureProfileFile!.path.split("/").last,
        ),
      );
    }

    // Kirim request
    var response = await requestMultipart.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);

    if (response.statusCode == 200) {
      return Right(ProfilResponseModel.fromJson(jsonDecode(responseString)));
    } else {
      return Left('Server Error');
    }
  }

  Future<bool> resetPassword(ResetPasswordRequestModel request) async {
    var url = Uri.parse(ApiPath.baseUrl + '/v1/reset-password');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.post(url,
        headers: {
          'Authorization': token,
        },
        body: request.toJson());

    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
