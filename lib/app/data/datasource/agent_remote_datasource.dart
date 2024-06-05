import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/detail_agent_response_model.dart';
import 'package:propertio_getx/app/data/model/responses/list_agent_response_model.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'dart:convert';

import 'package:propertio_getx/app/shared/utils.dart';

class AgentRemoteDataSource {
  Future<Either<String, ListAgentModel>> getAgent(
      {String? search, int? page}) async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = Uri.parse(
        ApiPath.baseUrl + '/v1/agent?search=${search ?? ''}&page=${page ?? 1}');
    final response = await http.get(url);

    print(response.body);
    if (response.statusCode == 200) {
      return Right(ListAgentModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Server Error');
    }
  }

  Future<Either<String, DetailAgentResponseModel>> getDetailAgent(
      String id) async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = Uri.parse(ApiPath.baseUrl + '/v1/agent/$id');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.get(url, headers: {
      'Authorization': token,
    });

    print(response.body);
    if (response.statusCode == 200) {
      return Right(
          DetailAgentResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Server Error');
    }
  }
}
