import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/routes/app_pages.dart';
import 'package:propertio_getx/app/shared/ui/components/text_failure.dart';
import 'package:propertio_getx/app/shared/ui/widgets/agent_card.dart';
import 'package:propertio_getx/app/shared/ui/widgets/item_tipe_apartemen.dart';
import 'package:propertio_getx/app/shared/ui/widgets/proyek_card.dart';
import 'package:propertio_getx/app/shared/ui/widgets/small_proyek_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  // HomeView({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Image.asset('assets/img_banner_properti.jpeg')),
        ],
      );
    }

    Widget tipeApartemen() {
      return Column(
        children: [
          Text('Eksplor berbagai tipe Properti',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16)),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ItemTipeApartemen('Surabaya',
                    img: 'assets/img_tp_apart_surabaya.png'),
                ItemTipeApartemen('Yogyakarta',
                    img: 'assets/img_tp_apart_yogya.png'),
                ItemTipeApartemen('Semarang',
                    img: 'assets/img_tp_apart_semarang.png'),
                ItemTipeApartemen('Jakarta',
                    img: 'assets/img_tp_apart_jakarta.png'),
              ],
            ),
          ),
        ],
      );
    }

    Widget listProyek() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Proyek Terbaru',
                  style: primaryTextStyle.copyWith(
                      fontWeight: bold, fontSize: 16)),
              GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.PROJECT);
                  },
                  child: Text('Lihat lebih banyak', style: thirdTextStyle))
            ],
          ),
          SizedBox(height: 8),
          Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: controller
                            .homePageData.value!.data!.projectLatest!
                            .map((proyek) => ProyekCard(proyek))
                            .toList()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pilihan Proyek Terbaik',
                          style: primaryTextStyle.copyWith(
                              fontWeight: bold, fontSize: 16)),
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.PROJECT);
                          },
                          child:
                              Text('Lihat lebih banyak', style: thirdTextStyle))
                    ],
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: controller
                            .homePageData.value!.data!.projectRecomendation!
                            .map((proyek) => SmallProyekCard(proyek: proyek))
                            .toList()),
                  ),
                  SizedBox(height: 16),
                  tipeApartemen(),
                ],
              );
            }
          })
        ],
      );
    }

    Widget agen() {
      return Column(
        children: [
          Text('Agen Pilihan',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16)),
          SizedBox(height: 8),
          Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: controller.homePageData.value!.data!.agents!
                            .map((agen) => AgentCard(agen, useMargin: true))
                            .toList()),
                  ),
                ],
              );
            }
          })
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      color: bgColor1,
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          controller.fetchHomePageData();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            header(),
            SizedBox(height: 16),
            listProyek(),
            SizedBox(height: 16),
            agen(),
          ],
        ),
      ),
    );
  }
}
