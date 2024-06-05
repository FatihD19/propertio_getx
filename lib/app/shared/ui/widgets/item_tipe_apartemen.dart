import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/modules/project/controllers/project_controller.dart';
import 'package:propertio_getx/app/routes/app_pages.dart';

class ItemTipeApartemen extends StatelessWidget {
  String? img;
  String location;

  ItemTipeApartemen(this.location, {this.img, super.key});

  @override
  Widget build(BuildContext context) {
    final ProjectController controller = Get.find<ProjectController>();
    return GestureDetector(
      onTap: () {
        controller.searchBylocation(location);
      },
      child: Stack(
        children: [
          Container(
            width: 126,
            height: 208,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(img ?? 'assets/img_tipe_apart.png')),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
              top: 9,
              left: 9,
              child: Text(location,
                  style: buttonTextStyle.copyWith(
                      fontWeight: bold, fontSize: 12))),
        ],
      ),
    );
  }
}
