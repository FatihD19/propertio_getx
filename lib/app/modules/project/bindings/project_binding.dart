import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/project_remote_datasource.dart';

import '../controllers/project_controller.dart';

class ProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectRemoteDataSource>(
      () => ProjectRemoteDataSource(),
    );
    Get.lazyPut<ProjectController>(
      () => ProjectController(Get.find<ProjectRemoteDataSource>()),
    );
  }
}
