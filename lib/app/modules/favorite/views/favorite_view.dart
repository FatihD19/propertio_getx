import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/dialog_view.dart';
import 'package:propertio_getx/app/shared/ui/components/pagination_button/pagination_button.dart';
import 'package:propertio_getx/app/shared/ui/components/text_failure.dart';
import 'package:propertio_getx/app/shared/ui/widgets/proyek_card.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Properti Favorit Saya',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16))
        ],
      );
    }

    Widget listProject() {
      return Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.isError.value) {
          return TextFailure(message: controller.errorMessage.value);
        } else {
          return Column(
            children: [
              Column(
                  children: controller
                      .favoriteData.value!.data!.projectFavorites!
                      .map((proyek) {
                return ProyekCard(proyek, isFavorite: true, onDelete: () {
                  confirmDialog(Get.overlayContext!, 'Hapus dari favorit',
                      'Apakah anda yakin ingin menghapus dari favorit?', () {
                    controller.deleteFavoriteProject('${proyek.projectCode}');
                  });
                });
              }).toList()),
              NavigationButton(
                // currentPage:
                //     controller.projectData.value.data!.pagination!.currentPage!,
                lastPage:
                    controller.favoriteData.value!.data!.pagination!.lastPage!,
                implementLogic: (page) {
                  controller.fetchFavoriteData(page: page);
                },
              ),
            ],
          );
        }
      });
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: bgColor1,
      child: RefreshIndicator.adaptive(
        onRefresh: () {
          return controller.fetchFavoriteData();
        },
        child: ListView(
          children: [
            header(),
            SizedBox(height: 16),
            listProject(),
          ],
        ),
      ),
    );
  }
}
