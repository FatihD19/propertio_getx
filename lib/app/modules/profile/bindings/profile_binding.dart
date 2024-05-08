import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/profile_remote_datasource.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(ProfileRemoteDataSource()),
    );
  }
}
