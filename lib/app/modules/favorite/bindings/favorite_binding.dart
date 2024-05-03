import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/favortite_remote_datasource.dart';

import '../controllers/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(FavoriteRemoteDataSource()),
    );
  }
}
