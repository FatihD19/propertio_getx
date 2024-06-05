import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/project_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/detail_unit_response_model.dart';

class DetailUnitController extends GetxController {
  final ProjectRemoteDataSource _projectRemoteDataSource;
  Rx<DetailunitResponseModel> detailData = DetailunitResponseModel().obs;
  var isLoading = false.obs;
  var errorMessage = RxString('');
  var isError = false.obs;

  final String idUnit = Get.arguments;

  DetailUnitController(this._projectRemoteDataSource);
  @override
  void onInit() {
    fetchDetailUnitData(idUnit: idUnit);
    super.onInit();
  }

  Future<void> fetchDetailUnitData({required String idUnit}) async {
    isLoading(true);
    final result = await _projectRemoteDataSource.getDetailUnit(idUnit);
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
