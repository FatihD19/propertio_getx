import 'package:flutter/material.dart';
import 'package:propertio_getx/app/constants/api_path.dart';

import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/button.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailInfoAgenView extends StatelessWidget {
  final String name;
  final String phone;
  final String urlPhoto;
  final String city;
  final String province;
  DetailInfoAgenView(
      this.name, this.phone, this.urlPhoto, this.city, this.province,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img_bg_agen.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white, width: 0.6),
          boxShadow: [
            BoxShadow(
              color: Color(0xffD9D9D9).withOpacity(0.4),
              blurRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(ApiPath.image(urlPhoto))),
                ),
                SizedBox(width: 8),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: buttonTextStyle.copyWith(
                              fontWeight: bold, fontSize: 16)),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 22,
                          ),
                          Container(
                            width: 140,
                            child: Text(
                              '$city, $province',
                              style: buttonTextStyle.copyWith(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.local_phone_outlined,
                            color: Colors.white,
                            size: 22,
                          ),
                          Text('$phone',
                              style: buttonTextStyle.copyWith(fontSize: 12)),
                          Text('  |  ',
                              style: buttonTextStyle.copyWith(
                                  fontSize: 12, fontWeight: bold)),
                          Image.asset('assets/ic_wa.png'),
                          Text(' Whatsapp',
                              style: buttonTextStyle.copyWith(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              color: buttonTextColor,
              height: 1,
              child: SizedBox(width: double.infinity),
            ),
            SizedBox(height: 8),
            Text('Hubungi Kami Melalui',
                style: buttonTextStyle.copyWith(fontSize: 12)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TransparentButton(
                    text: 'Telepon',
                    img: 'assets/ic_call.png',
                    onPressed: () {
                      launchUrl(Uri.parse('tel:+$phone'));
                    }),
                TransparentButton(
                    text: 'Whatsapp',
                    img: 'assets/ic_wa.png',
                    onPressed: () {
                      launchUrl(Uri.parse(
                          'https://api.whatsapp.com/send?phone=$phone'));
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
