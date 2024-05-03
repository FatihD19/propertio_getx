import 'package:flutter/material.dart';
import 'package:propertio_getx/app/constants/api_path.dart';

import 'package:propertio_getx/app/constants/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoMapView extends StatelessWidget {
  bool? isDenah;
  String? lantitude;
  String? longitude;
  String? urlImg;
  InfoMapView(
      {this.urlImg,
      this.lantitude,
      this.longitude,
      this.isDenah = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 160,
            width: double.infinity,
            child: isDenah == true
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(ApiPath.image(urlImg.toString()),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/img_denah.png',
                          fit: BoxFit.cover);
                    }),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/img_map_view.png',
                        fit: BoxFit.cover))),
        Positioned(
          left: 112,
          right: 112,
          bottom: 64,
          top: 64,
          child: GestureDetector(
            onTap: () {
              launchUrl(isDenah == true
                  ? Uri.parse(ApiPath.image(urlImg.toString()))
                  : Uri.parse(
                      'https://www.google.com/maps?q=$lantitude,$longitude'));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isDenah == true ? 'Lihat Denah' : 'Lihat Map',
                      style: buttonTextStyle.copyWith(
                          fontWeight: bold, fontSize: 12)),
                  SizedBox(width: 6),
                  Image.asset('assets/ic_show_map.png'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
