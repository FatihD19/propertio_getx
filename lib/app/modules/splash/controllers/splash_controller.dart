import 'package:get/get.dart';

import 'package:propertio_getx/app/modules/login/controllers/login_controller.dart';

class SplashController extends GetxController {
  final LoginController loginController; // Controller login yang diinject

  SplashController(this.loginController);

  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 1));
    await loginController.AuthGetCurrentUser();
    if (loginController.isError.value == true) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/dashboard');
    }
    super.onInit();
  }
}
