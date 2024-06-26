import 'package:get/get.dart';
import 'package:propertio_getx/app/modules/login/controllers/login_controller.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        Get.find<LoginController>(),
      ),
    );
  }
}
