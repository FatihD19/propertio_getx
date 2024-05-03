import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/homepage_remote_datasource.dart';
import 'package:propertio_getx/app/modules/home/bindings/home_binding.dart';
import 'package:propertio_getx/app/modules/home/controllers/home_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
