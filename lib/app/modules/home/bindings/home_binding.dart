import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/homepage_remote_datasource.dart';
import 'package:propertio_getx/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(HomePageRemoteDataSource()));
  }
}
