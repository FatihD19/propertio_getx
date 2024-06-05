import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/agent_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/detail_agent_response_model.dart';
import 'package:propertio_getx/app/data/model/responses/list_agent_response_model.dart';
import 'package:propertio_getx/app/modules/agen/views/detail_agen_view.dart';

class AgenController extends GetxController {
  final AgentRemoteDataSource _agentRemoteDataSource;
  Rx<ListAgentModel> listAgent = ListAgentModel().obs;
  Rx<DetailAgentResponseModel> detailAgent = DetailAgentResponseModel().obs;

  String? id = Get.arguments;
  var isLoading = false.obs;
  var errorMessage = RxString('');
  var isError = false.obs;

  var searchAgentController = TextEditingController().obs;
  AgenController(this._agentRemoteDataSource);
  @override
  void onInit() async {
    if (id != null) {
      await getDetailAgent('${id}');
    } else {
      await fetchListAgentData();
    }
    super.onInit();
  }

  Future<void> fetchListAgentData({String? search, int? page}) async {
    isLoading(true);
    final result =
        await _agentRemoteDataSource.getAgent(search: search, page: page);

    isLoading(false);

    result.fold(
      (left) {
        errorMessage.value = left;
        isError(true);
      },
      (right) {
        errorMessage.value = '';
        listAgent.value = right;
        isError(false);
      },
    );
  }

  void navigateToDetailAgent(String id) async {
    getDetailAgent(id);
    Get.to(() => DetailAgenView(), arguments: id);
  }

  Future<void> getDetailAgent(String id) async {
    isLoading(true);
    final result = await _agentRemoteDataSource.getDetailAgent('${id}');

    isLoading(false);

    result.fold(
      (left) {
        errorMessage.value = left;
        isError(true);
      },
      (right) {
        errorMessage.value = '';
        detailAgent.value = right;
        isError(false);
      },
    );
  }
}
