import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/data/datasource/auth_remote_datasource.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(AuthRemoteDataSource(), AuthLocalDataSource()),
    );
  }
}
