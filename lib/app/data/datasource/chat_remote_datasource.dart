import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/list_chat_response_model.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'dart:convert';

import 'package:propertio_getx/app/shared/utils.dart';

class ChatRemoteDataSource {
  Future<Either<String, ListChatResponseModel>> getListChat(String id) async {
    if (await NetworkInfoException.isConnected() == false) {
      return const Left('Tidak Ada Koneksi Internet');
    }
    var url = Uri.parse(ApiPath.baseUrl + '/v1/progress/chat-list/$id');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.get(url, headers: {
      'Authorization': token,
    });

    print(response.body);
    if (response.statusCode == 200) {
      return Right(ListChatResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return Left('Server Error');
    }
  }

  Future<bool> postChatUser(String id, String message) async {
    if (await NetworkInfoException.isConnected() == false) {
      return false;
    }
    var url = Uri.parse(ApiPath.baseUrl + '/v1/progress/chat/$id');
    final token = await AuthLocalDataSource.getToken();
    final response = await http.post(url, headers: {
      'Authorization': token,
    }, body: {
      'message': message,
    });

    print(response.body);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
