import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/project_favorite_response_model.dart';
import 'dart:convert';

import 'package:propertio_getx/app/data/model/responses/property_favorite_response_model.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/shared/utils.dart';

class FavoriteRemoteDataSource {
  Future<Either<String, PropertyFavoriteResponseModel>> getFavoriteProperty(
      {int? page}) async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = Uri.parse(
        ApiPath.baseUrl + '/v1/favorite?page=${page ?? 1}&type=property');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.get(url, headers: {
      'Authorization': token,
    });

    print(response.body);

    if (response.statusCode == 200) {
      return Right(
          PropertyFavoriteResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left(jsonDecode(response.body)['message']);
    }
  }

  Future<Either<String, ProjectFavoriteResponseModel>> getFavoriteProject(
      {int? page}) async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = Uri.parse(
        ApiPath.baseUrl + '/v1/favorite?page=${page ?? 1}&type=project');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.get(url, headers: {
      'Authorization': token,
    });

    print(response.body);

    if (response.statusCode == 200) {
      return Right(
          ProjectFavoriteResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Server Error');
    }
  }

  Future<bool> postFavorite({String? propertyCode, String? projectCode}) async {
    if (await NetworkInfoException.isConnected() == false) {
      return false;
    }
    var url = projectCode == null
        ? Uri.parse(ApiPath.baseUrl + '/v1/favorite/property')
        : Uri.parse(ApiPath.baseUrl + '/v1/favorite/project');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.post(url,
        headers: {
          'Authorization': token,
        },
        body: propertyCode == null
            ? {'project_code': projectCode}
            : {'property_code': propertyCode});
    print('favorite response: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteFavorite(
      {String? propertyCode, String? projectCode}) async {
    if (await NetworkInfoException.isConnected() == false) {
      return false;
    }
    var url = propertyCode == null
        ? Uri.parse(ApiPath.baseUrl + '/v1/favorite/project/$projectCode')
        : Uri.parse(ApiPath.baseUrl + '/v1/favorite/property/$propertyCode');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.delete(url, headers: {
      'Authorization': token,
    });
    print('favorite response: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
