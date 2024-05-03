import 'package:flutter/material.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/container_style.dart';
import 'package:url_launcher/url_launcher.dart';

class PromoArApp extends StatelessWidget {
  const PromoArApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customBoxDecoration(),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Augmented Reality (AR) Apps ',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16)),
          SizedBox(height: 8),
          Text(
            'Unduh aplikasi AR kami melalui Google Play dan rasakan pengalaman tak terlupakan.',
            style: primaryTextStyle.copyWith(fontSize: 12),
          ),
          SizedBox(height: 8),
          GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(
                    'https://play.google.com/store/apps/details?id=com.CitraNumusiBirawa.CNImmersiveProperty'));
              },
              child:
                  Center(child: Image.asset('assets/img_getOn_playstore.png')))
        ],
      ),
    );
  }
}
