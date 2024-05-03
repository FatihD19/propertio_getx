import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/properti_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/list_propertyType_Response_model.dart';

class PropertyTypeController extends GetxController {
  final PropertiRemoteDataSource _propertiRemoteDataSource;
  Rx<ListPropertyTypeResponseModel> propertyTypeData =
      ListPropertyTypeResponseModel().obs;
  var isLoading = false.obs;
  var errorMessage = RxString('');
  var isError = false.obs;

  PropertyTypeController(this._propertiRemoteDataSource);

  @override
  void onInit() {
    super.onInit();
    fetchPropertyTypeData();
  }

  Future<void> fetchPropertyTypeData() async {
    isLoading(true);
    final result = await _propertiRemoteDataSource.getTipeProperti();
    isLoading(false);

    result.fold(
      (left) {
        errorMessage.value = left;
        isError(true);
      },
      (right) {
        errorMessage.value = '';
        propertyTypeData.value = right;
        isError(false);
      },
    );
  }
}
