import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:propertio_getx/app/constants/api_path.dart';

import 'package:propertio_getx/app/constants/theme.dart';

import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPromoCarousel extends StatefulWidget {
  final List img;
  bool? isVirtual;
  String? virtualUrl;
  InfoPromoCarousel(this.img,
      {this.isVirtual = false, this.virtualUrl, super.key});

  @override
  State<InfoPromoCarousel> createState() => _InfoPromoCarouselState();
}

class _InfoPromoCarouselState extends State<InfoPromoCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        width: 10,
        height: 10,
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
        ),
      );
    }

    int index = -1;
    return Container(
        // color: bgColor2,
        child: Stack(
      children: [
        Column(
          children: [
            CarouselSlider(
              items: widget.img.map((e) {
                return Container(
                    // decoration: BoxDecoration(
                    //   // borderRadius: BorderRadius.circular(10),
                    //   image: DecorationImage(
                    //     fit: BoxFit.cover,
                    //     image: NetworkImage(ApiPath.image(e)),
                    //   ),
                    // ),
                    child: Image.network(
                  ApiPath.image(e),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, color: Colors.red);
                  },
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 280,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffF3F3F3),
                              ),
                            ),
                          );
                  },
                ));
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.img.map((e) {
                index++;
                return indicator(index);
              }).toList(),
            ),
            SizedBox(height: 10),
          ],
        ),
        widget.isVirtual == false
            ? SizedBox()
            : Positioned(
                bottom: 64,
                left: MediaQuery.of(context).size.width / 2 - 76,
                child: GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse('${widget.virtualUrl}'));
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
    ));
  }
}
