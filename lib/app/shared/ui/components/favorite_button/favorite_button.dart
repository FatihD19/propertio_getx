import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/shared/ui/components/favorite_button/favorite_button_controller.dart';

class FavoriteButton extends StatelessWidget {
  bool? isFavorite;
  String? propertyCode;
  String? projectCode;

  FavoriteButton(
      {this.isFavorite = false, this.propertyCode, this.projectCode});

  // Set nilai awal favorit

  @override
  Widget build(BuildContext context) {
    // Membuat instance baru dari FavoriteButtonController untuk setiap FavoriteButton
    final favoriteController = Get.put(
      FavoriteButtonController(isFavorite: RxBool(isFavorite!)),
      tag: projectCode, // Menambahkan tag untuk unik per item
    );
    return Obx(() {
      return GestureDetector(
        onTap: () {
          favoriteController.toggleFavorite(projectCode!);
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff94949480).withOpacity(0.5),
          ),
          child: Center(
            child: favoriteController.isFavorite.value
                ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                    size: 18,
                  )
                : const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
          ),
        ),
      );
    });
  }
}
