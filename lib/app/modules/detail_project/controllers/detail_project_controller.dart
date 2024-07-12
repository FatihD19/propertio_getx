import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/project_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/detail_project_response_model.dart';

class DetailProjectController extends GetxController {
  final ProjectRemoteDataSource _projectRemoteDataSource;
  var detailData = Rxn<DetailProjectResponseModel>();
  var isLoading = false.obs;
  var errorMessage = RxString('');
  var isError = false.obs;

  // final String slug = Get.arguments;

  DetailProjectController(this._projectRemoteDataSource);

  @override
  void onInit() {
    super.onInit();
    String slug = Get.arguments ?? '';
    fetchDetailProjectData(slug);
  }

  Future<void> fetchDetailProjectData(String slugId) async {
    isLoading(true);
    final result = await _projectRemoteDataSource.getDetailProject(slugId);
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
