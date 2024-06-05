import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/project_remote_datasource.dart';

import '../controllers/detail_unit_controller.dart';

class DetailUnitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailUnitController>(
      () => DetailUnitController(Get.find<ProjectRemoteDataSource>()),
    );
  }
}
