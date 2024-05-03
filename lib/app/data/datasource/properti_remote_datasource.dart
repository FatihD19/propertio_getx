import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/detail_properti_response_model.dart';
import 'package:propertio_getx/app/data/model/responses/list_properti_response_model.dart';
import 'package:propertio_getx/app/data/model/responses/list_propertyType_Response_model.dart';
import 'dart:convert';

import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/shared/utils.dart';

class PropertiRemoteDataSource {
  Future<Either<String, ListPropertyModel>> getProperti(
      {bool? isRent, String? query, int? page, String? type}) async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = isRent == true
        ? Uri.parse(ApiPath.baseUrl +
            '/v1/property?type=rent&page=${page ?? 1}&property_type=${type ?? ''}&search=${query ?? ''}')
        : Uri.parse(ApiPath.baseUrl +
            '/v1/property?type=sell&page=${page ?? 1}&property_type=${type ?? ''}&search=${query ?? ''}');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.get(url, headers: {'Authorization': token});

    print(response.body);
    if (response.statusCode == 200) {
      return Right(ListPropertyModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Server Error');
    }
  }

  Future<Either<String, DetailPropertiResponseModel>> getDetailProperti(
      String slug) async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = Uri.parse(ApiPath.baseUrl + '/v1/property/$slug');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.get(url, headers: {'Authorization': token});

    print(response.body);
    if (response.statusCode == 200) {
      return Right(
          DetailPropertiResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Server Error');
    }
  }

  Future<Either<String, ListPropertyTypeResponseModel>>
      getTipeProperti() async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = Uri.parse(ApiPath.baseUrl + '/v1/cms/property-type');
    final response = await http.get(url);

    print('TIPE_PROPERTI' + response.body);
    if (response.statusCode == 200) {
      return Right(
          ListPropertyTypeResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Server Error');
    }
  }
}
