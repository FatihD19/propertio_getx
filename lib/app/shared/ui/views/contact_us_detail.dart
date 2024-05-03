import 'package:flutter/material.dart';
import 'package:propertio_getx/app/shared/ui/components/button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:propertio_getx/app/constants/theme.dart';

class ContactUsDetail extends StatelessWidget {
  bool? isUnit;
  bool? isProyek;
  String? price;
  String? waMessasge;
  String? waNumber;
  String? surfaceArea;
  bool? isRent;
  ContactUsDetail(
      {this.isProyek = false,
      this.waMessasge,
      this.waNumber,
      this.price,
      this.surfaceArea,
      this.isUnit = false,
      this.isRent = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    Widget contactBtn() {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse('tel:+$waNumber'));
            },
            child: Image.asset(
              'assets/ic_contact_call.png',
              width: 42,
              height: 42,
            ),
          ),
          SizedBox(width: 4),
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(
                  'https://api.whatsapp.com/send?phone=$waNumber&text=Halo saya ingin mengetahui lebih lanjut mengenai $waMessasge'));
            },
            child: Image.asset(
              'assets/ic_contact_wa.png',
              width: 42,
              height: 42,
            ),
          )
        ],
      );
    }

    Widget unitBooking() {
      return Container(
        height: 140,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Harga mulai dari',
                        style: secondaryTextStyle.copyWith(fontSize: 12)),
                    Row(
                      children: [
                        Text('$price',
                            style: thirdTextStyle.copyWith(
                                fontSize: 24, fontWeight: bold)),
                        SizedBox(width: 4),
                        Text('($surfaceArea/m2)',
                            style: secondaryTextStyle.copyWith(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              children: [
                contactBtn(),
                SizedBox(width: 8),
                Expanded(
                  child: CustomButton(text: 'Booking Unit', onPressed: () {}),
                ),
              ],
            )
          ],
        ),
      );
    }

    return isUnit == true
        ? unitBooking()
        : isProyek == true
            ? FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Harga mulai dari',
                              style: secondaryTextStyle.copyWith(fontSize: 12)),
                          Container(
                            width: 200, // Atur lebar sesuai kebutuhan
                            child: Text('$price',
                                style: thirdTextStyle.copyWith(
                                    fontSize: 18, fontWeight: bold)),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      contactBtn()
                    ],
                  ),
                ),
              )
            : Container(
                height: 90,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Harga mulai dari',
                            style: secondaryTextStyle.copyWith(fontSize: 12)),
                        Row(
                          children: [
                            Container(
                              child: Text('$price',
                                  style: thirdTextStyle.copyWith(
                                      fontSize: 21, fontWeight: bold)),
                            ),
                            SizedBox(width: 4),
                            isRent == true
                                ? Text(' per tahun',
                                    style:
                                        primaryTextStyle.copyWith(fontSize: 12))
                                : Text('($surfaceArea/m2)',
                                    style: secondaryTextStyle.copyWith(
                                        fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    contactBtn()
                  ],
                ),
              );
  }
}
