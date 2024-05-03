import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:propertio_getx/app/constants/api_path.dart';
import 'dart:convert';

import 'package:propertio_getx/app/data/model/responses/address_response_model.dart';
import 'package:propertio_getx/app/constants/api_path.dart';

class AddressRemoteDataSource {
  Future<Either<String, List<ProvinceResponseModel>>> getProvince() async {
    var url = Uri.parse(ApiPath.baseUrl + '/provinces');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Right(List<ProvinceResponseModel>.from(
        jsonDecode(response.body).map(
          (province) => ProvinceResponseModel.fromJson(province),
        ),
      ));
    } else {
      return Left('Server Error');
    }
  }

  Future<Either<String, List<CitiesResponseModel>>> getCity(
      String provinceId) async {
    var url = Uri.parse(ApiPath.baseUrl + '/cities/$provinceId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Right(List<CitiesResponseModel>.from(
        jsonDecode(response.body).map(
          (cities) => CitiesResponseModel.fromJson(cities),
        ),
      ).toList());
    } else {
      return Left('Server Error');
    }
  }
}
