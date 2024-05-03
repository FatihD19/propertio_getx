import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';

import 'package:propertio_getx/app/data/model/request/login_request_model.dart';
import 'package:propertio_getx/app/data/model/request/register_request_model.dart';
import 'package:propertio_getx/app/data/model/responses/login_response_model.dart';

import 'package:propertio_getx/app/shared/utils.dart';

class AuthRemoteDataSource {
  Future<Either<String, LoginResponseModel>> login(
      LoginRequestModel data) async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = Uri.parse(ApiPath.baseUrl + '/v1/auth/login');
    final response = await http.post(url, body: data.toJson());
    if (response.statusCode == 200) {
      print(response.body);
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(json.decode(response.body));
      await AuthLocalDataSource().storeCredentialToLocal(
          loginResponseModel.data!.user!
              .copyWith(email: data.email, password: data.password),
          loginResponseModel.data!.token!);
      return Right(loginResponseModel);
    } else {
      return Left('Server Error');
    }
  }

  Future<bool> register(RegisterRequestModel request) async {
    if (await NetworkInfoException.isConnected() == false) {
      return false;
    }
    var url = Uri.parse(ApiPath.baseUrl + '/v1/auth/register/user');
    var requestMultipart = http.MultipartRequest('POST', url);
    requestMultipart.fields.addAll(
      request.toJson().map((key, value) => MapEntry(key, value.toString())),
    );
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
    var response = await requestMultipart.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
