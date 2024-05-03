import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:propertio_getx/app/shared/ui/components/dialog_view.dart';

class FavoriteButtonController extends GetxController {
  RxBool isFavorite = false.obs; // State untuk menyimpan status favorit
  // final String projectCode;

  FavoriteButtonController({required this.isFavorite});
  final FavoriteController favoriteController = Get.find<FavoriteController>();

  void toggleFavorite(String projectCode) {
    if (isFavorite.value) {
      // Jika favorit, hapus dari favorit

      confirmDialog(Get.overlayContext!, 'Hapus dari favorit',
          'Apakah anda yakin ingin menghapus dari favorit?', () {
        favoriteController.deleteFavoriteProject(projectCode);
        isFavorite.value = false;
      });
    } else {
      favoriteController.addFavoriteProject(projectCode);
      isFavorite.value = true;
    }
  }

  // void addFavorite() async {
  //   await AuthLocalDataSource.statusLogin() == false
  //       ? errorDialog(Get.overlayContext!, 'Anda harus login terlebih dahulu',
  //           'Untuk menambahkan ke favorit', onConfirm: () {
  //           Get.toNamed('/login');
  //         })
  //       : toggleFavorite();
  // }

  // void checkFavorite(bool isDelete) {
  //   if (isDelete == true) {
  //     confirmDialog(Get.overlayContext!, 'Hapus dari favorit',
  //         'Apakah anda yakin ingin menghapus dari favorit?', () {
  //       favoriteController.deleteFavoriteProject(projectCode!);
  //       isFavorite = false;
  //       areFavorite.value = false;
  //       update();
  //     });
  //   } else {
  //     favoriteController.addFavoriteProject(projectCode!);
  //     isFavorite = true;
  //     areFavorite.value = true;
  //     update();
  //   }
  // }
}
  // // void toggleFavorite(){
  // //   isFavorite.value = !isFavorite.value;
  // // }

  // addFavorite(bool isDelete){

