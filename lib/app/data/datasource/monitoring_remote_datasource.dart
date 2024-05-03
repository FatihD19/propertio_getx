import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/detail_project_progress_response_model.dart';
import 'dart:convert';

import 'package:propertio_getx/app/data/model/responses/list_projectProgress_response_model.dart';
import 'package:propertio_getx/app/data/model/responses/project_progress_page_response_model.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/shared/utils.dart';

class MonitoringRemoteDataSource {
  Future<Either<String, ListProjectProgressResponseModel>>
      getProjectProgress() async {
    var url = Uri.parse(ApiPath.baseUrl + '/v1/project-progress-lists');
    final token = await AuthLocalDataSource.getToken();
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    final response = await http.get(url, headers: {
      'Authorization': token,
    });
    print(response.body);
    if (response.statusCode == 200) {
      return Right(
          ListProjectProgressResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Server Error');
    }
  }

  Future<Either<String, ProgressProjectPageResponseModel>>
      getProjectProgressPage(String id) async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url =
        Uri.parse(ApiPath.baseUrl + '/v1/project-progress-lists/progress/$id');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.get(url, headers: {'Authorization': token});

    print(response.body);
    if (response.statusCode == 200) {
      return Right(
          ProgressProjectPageResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Server Error');
    }
  }

  Future<Either<String, DetailProjectProgressResponseModel>>
      getDetailProjectProgress(String id) async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = Uri.parse(
        ApiPath.baseUrl + '/v1/project-progress-lists/progress-detail/$id');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.get(url, headers: {'Authorization': token});

    print(response.body);
    if (response.statusCode == 200) {
      return Right(DetailProjectProgressResponseModel.fromJson(
          jsonDecode(response.body)));
    } else {
      return const Left('Server Error');
    }
  }
}
