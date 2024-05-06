import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/project_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/detail_project_response_model.dart';
import 'package:propertio_getx/app/modules/project/controllers/project_controller.dart';

class DetailProjectController extends GetxController {
  final ProjectRemoteDataSource _projectRemoteDataSource;
  Rx<DetailProjectResponseModel> detailData = DetailProjectResponseModel().obs;
  var isLoading = false.obs;
  var errorMessage = RxString('');
  var isError = false.obs;

  final String slug = Get.arguments;

  DetailProjectController(this._projectRemoteDataSource);

  final projectController = Get.find<ProjectController>();

  @override
  void onInit() {
    super.onInit();
    fetchDetailProjectData(slug: slug);
  }

  Future<void> fetchDetailProjectData({required String slug}) async {
    isLoading(true);
    final result = await _projectRemoteDataSource.getDetailProject(slug);
    isLoading(false);

    result.fold(
      (left) {
        errorMessage.value = left;
        isError(true);
      },
      (right) {
        errorMessage.value = '';
        detailData.value = right;
        isError(false);
      },
    );
  }
}
