import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/agent_remote_datasource.dart';

import '../controllers/agen_controller.dart';

class AgenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgentRemoteDataSource>(
      () => AgentRemoteDataSource(),
    );
    Get.lazyPut<AgenController>(
      () => AgenController(Get.find<AgentRemoteDataSource>()),
    );
  }
}
