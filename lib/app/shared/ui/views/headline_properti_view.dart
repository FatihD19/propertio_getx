import 'package:flutter/material.dart';
import 'package:propertio_getx/app/data/model/properti_model.dart';

import 'package:propertio_getx/app/shared/ui/components/container_style.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/favorite_button/favorite_button.dart';
import 'package:propertio_getx/app/shared/utils.dart';

import 'package:share_plus/share_plus.dart';

class HeadlinePropertiView extends StatelessWidget {
  String? status;
  bool? isProyek;
  String rangePrice;
  String? title;
  String? headline;
  Address? address;
  int? countViews;
  String? shareUrl;
  DateTime? postedAt;
  bool? isFavorite;
  String? propertyCode;
  String? projectCode;
  HeadlinePropertiView(
      {this.status,
      this.rangePrice = '0',
      this.title,
      this.headline,
      this.address,
      this.countViews,
      this.isProyek = false,
      this.shareUrl,
      this.postedAt,
      this.isFavorite = false,
      this.propertyCode,
      this.projectCode,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: customBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 210,
                child: Text('$title',
                    style: primaryTextStyle.copyWith(
                        fontSize: 19, fontWeight: bold)),
              ),
              Row(
                children: [
                  FavoriteButton(
                      isFavorite: isFavorite,
                      projectCode: projectCode,
                      propertyCode: propertyCode),
                  // Image.asset('assets/ic_circle_like.png',
                  //     fit: BoxFit.cover, width: 30, height: 30),
                  SizedBox(width: 4),
                  // Image.asset('assets/ic_circle_print.png',
                  //     width: 30, height: 30),
                  // SizedBox(width: 4),
                  GestureDetector(
                    onTap: () async {
                      await Share.share('Lihat Properti berikut $shareUrl',
                          subject: 'Informasi Properti');
                    },
                    child: Image.asset('assets/ic_circle_share.png',
                        width: 30, height: 30),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 8),
          Text('$headline',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 15)),
          SizedBox(height: 8),
          Text('${address?.city}, ${address?.province}',
              style: secondaryTextStyle),
          SizedBox(height: 8),
          Row(
            children: [
              status == null
                  ? SizedBox()
                  : Row(
                      children: [
                        Image.asset('assets/ic_lock.png',
                            width: 16, height: 16),
                        SizedBox(width: 8),
                        Text('${status == 'sell' ? 'Jual' : 'Sewa'}',
                            style: primaryTextStyle.copyWith(fontSize: 12)),
                        SizedBox(width: 16),
                      ],
                    ),
              Row(
                children: [
                  Image.asset('assets/ic_calendar.png', width: 16, height: 16),
                  SizedBox(width: 8),
                  Text('${calculateTimeDifference(postedAt.toString())}',
                      style: primaryTextStyle.copyWith(fontSize: 12)),
                  SizedBox(width: 16),
                ],
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      Image.asset('assets/ic_eye.png', width: 16, height: 16),
                      SizedBox(width: 8),
                      Text('$countViews kali dilihat',
                          style: primaryTextStyle.copyWith(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          isProyek == false
              ? SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: secondaryColor,
                      height: 1,
                      child: SizedBox(width: double.infinity),
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Harga mulai dari',
                            style: secondaryTextStyle.copyWith(fontSize: 12)),
                        Text('$rangePrice',
                            style: primaryTextStyle.copyWith(
                                fontSize: 20, fontWeight: bold))
                      ],
                    )
                  ],
                )
        ],
      ),
    );
  }
}
