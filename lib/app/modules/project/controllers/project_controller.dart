import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/project_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/list_project_response_model.dart';

class ProjectController extends GetxController {
  final ProjectRemoteDataSource _projectRemoteDataSource;
  Rx<ListProjectModel> projectData = ListProjectModel().obs;
  var isLoading = false.obs;
  var errorMessage = RxString('');
  var isError = false.obs;

  ProjectController(this._projectRemoteDataSource);
  RxString selectedType = 'Rumah'.obs;
  var searchController = TextEditingController().obs;
  @override
  void onInit() {
    super.onInit();
    fetchProjectData();
  }

  Future<void> fetchProjectData(
      {String? query, int? page, String? type}) async {
    isLoading(true);
    final result = await _projectRemoteDataSource.getProject(
        query: query, page: page, type: type);
    isLoading(false);

    result.fold(
      (left) {
        errorMessage.value = left;
        isError(true);
      },
      (right) {
        errorMessage.value = '';
        projectData.value = right;
        isError(false);
      },
    );
    // projectData.refresh();
    update();
  }
}
