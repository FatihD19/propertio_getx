import 'package:get/get.dart';

import 'package:propertio_getx/app/modules/login/controllers/login_controller.dart';

class SplashController extends GetxController {
  final LoginController loginController; // Controller login yang diinject

  SplashController(this.loginController);

  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 1));
    loginController.AuthGetCurrentUser();
    super.onInit();
  }
}
