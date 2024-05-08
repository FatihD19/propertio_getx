import 'package:get/get.dart';

import '../controllers/kpr_controller.dart';

class KprBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KprController>(
      () => KprController(),
    );
  }
}
