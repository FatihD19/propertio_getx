import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/api_path.dart';

import 'package:propertio_getx/app/constants/theme.dart';

import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPromoCarousel extends StatelessWidget {
  final List<String> img; // Parameter list image

  bool? isVirtual;
  String? virtualUrl;
  InfoPromoCarousel(this.img,
      {this.isVirtual = false, this.virtualUrl, super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(InfoPromoCarouselController()); // Inject controller

    Widget indicator(int index) {
      return Obx(() {
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: controller.currentIndex.value == index
                ? primaryColor
                : Color(0xffC4C4C4),
          ),
        );
      });
    }

    return Stack(
      children: [
        Column(
          children: [
            CarouselSlider(
              items: img.map((e) {
                return Image.network(
                  ApiPath.image(e),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, color: Colors.red);
                  },
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : Container(
                            height: 280,
                            color: Colors.grey[300],
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  controller.updateCurrentIndex(index); // Update currentIndex
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                img.length,
                (index) => indicator(index),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        isVirtual == false
            ? SizedBox()
            : Positioned(
                bottom: 64,
                left: MediaQuery.of(context).size.width / 2 - 76,
                child: GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse('${virtualUrl}'));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return VirtualView();
                    // }));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    width: 153,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff000000).withOpacity(0.5),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff000000).withOpacity(0.5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Image.asset('assets/ic_virtual.png'),
                        SizedBox(width: 8),
                        Text('Mulai Tur Virtual',
                            style: buttonTextStyle.copyWith(
                                fontWeight: bold, fontSize: 12))
                      ],
                    ),
                  ),
                ),
              )
      ],
    );
  }
}

class InfoPromoCarouselController extends GetxController {
  var currentIndex =
      0.obs; // Gunakan RxInt untuk perubahan state yang dapat diamati

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
