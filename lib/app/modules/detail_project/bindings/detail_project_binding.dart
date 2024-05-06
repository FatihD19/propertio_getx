import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/project_remote_datasource.dart';

import '../controllers/detail_project_controller.dart';

class DetailProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProjectController>(
      () => DetailProjectController(Get.find<ProjectRemoteDataSource>()),
    );
  }
}
