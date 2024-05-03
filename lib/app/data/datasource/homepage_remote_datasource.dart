import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/homepage_response_Model.dart';

import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:http/http.dart' as http;
import 'package:propertio_getx/app/shared/utils.dart';

class HomePageRemoteDataSource {
  Future<Either<String, HomePageModel>> getHomePage() async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = Uri.parse(ApiPath.baseUrl + '/v1/homepage');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.get(url, headers: {
      'Authorization': token,
    });

    print(response.body);
    if (response.statusCode == 200) {
      return Right(HomePageModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Server Error');
    }
  }
}
