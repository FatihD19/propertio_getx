import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) async {
    tabIndex = index;
    if ((index == 2 || index == 3) &&
        await AuthLocalDataSource.statusLogin() == false) {
      Get.toNamed('/login');
    }
    update();
  }
}
