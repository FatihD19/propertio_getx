import 'package:flutter/material.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/data/model/proyek_model.dart';

import 'package:propertio_getx/app/data/model/unit_model.dart';
import 'package:propertio_getx/app/shared/ui/components/custom_chip.dart';

import 'package:propertio_getx/app/shared/ui/components/container_style.dart';

import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/favorite_button/favorite_button.dart';
import 'package:propertio_getx/app/shared/ui/components/text_price.dart';
import 'package:propertio_getx/app/shared/ui/widgets/properti_card.dart';

class SmallProyekCard extends StatelessWidget {
  bool? isFavorite;
  bool? isUnit;
  ProjectModel? proyek;
  SmallProyekCard(
      {this.proyek, this.isFavorite, this.isUnit = false, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             DetailProyekPage(proyek!.slug.toString())));
      },
      child: Card(
        margin: EdgeInsets.only(right: 16, top: 4, bottom: 4),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 199,
          decoration: customBoxDecoration(),
          child: Stack(
            children: [
              Column(
                children: [
                  isUnit == true
                      ? Image.asset('assets/img_small_properti.png',
                          fit: BoxFit.cover)
                      : ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: proyek!.photo.toString() == 'null'
                              ? Image.asset(
                                  'assets/img_small_properti.png',
                                  fit: BoxFit.cover,
                                  height: 160,
                                )
                              : Image.network(
                                  ApiPath.image(proyek!.photo.toString()),
                                  fit: BoxFit.cover,
                                  height: 160,
                                  width: double.infinity,
                                  // height: 280,
                                ),
                        ),
                  Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            proyek!.title.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: primaryTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                              '${proyek!.address?.district}, ${proyek!.address?.city}, ${proyek!.address?.province}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: secondaryTextStyle.copyWith(fontSize: 12)),
                          SizedBox(height: 8),
                          isUnit == true
                              ? SizedBox()
                              : Text('Harga Mulai dari',
                                  style:
                                      primaryTextStyle.copyWith(fontSize: 10)),
                          TextPrice(proyek!.price.toString()),
                          SizedBox(height: 8),
                          isUnit == true
                              ? Row(
                                  children: [
                                    Facility(
                                        value: '4', img: 'assets/ic_bed.png'),
                                    Facility(
                                        value: '4', img: 'assets/ic_bath.png'),
                                    Facility(
                                        value: '1200',
                                        img: 'assets/ic_luas.png'),
                                  ],
                                )
                              : SizedBox()
                        ],
                      )),
                ],
              ),
              isFavorite == false
                  ? SizedBox()
                  : Positioned(
                      top: 10,
                      right: 10,
                      child: FavoriteButton(
                        isFavorite: proyek?.isFavorites,
                        projectCode: proyek?.projectCode,
                      )),
              isUnit == true
                  ? Positioned(
                      top: 10,
                      left: 10,
                      child: ChipBorder('100 Unit'),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

class SmallProyekCardUnit extends StatelessWidget {
  bool? isFavorite;
  UnitModel? unit;
  String? projectCode;
  SmallProyekCardUnit(
      {this.unit, this.isFavorite, this.projectCode, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             DetailUnitPage(unit!.unitCode.toString())));
      },
      child: Card(
        margin: EdgeInsets.only(right: 16, top: 4, bottom: 4),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 199,
          // margin: EdgeInsets.only(right: 16),
          decoration: customBoxDecoration(),
          child: Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: unit!.photo.toString() == 'null'
                        ? Image.asset('assets/img_small_properti.png',
                            fit: BoxFit.cover)
                        : Image.network(
                            ApiPath.image(unit!.photo.toString()),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 160,
                          ),
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            unit!.title.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: primaryTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextPrice(unit!.price.toString()),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Facility(
                                  value: unit!.bedroom ?? '0',
                                  img: 'assets/ic_bed.png'),
                              Facility(
                                  value: unit!.bathroom ?? '0',
                                  img: 'assets/ic_bath.png'),
                              Facility(
                                  value: ' ${unit?.surfaceArea} m2',
                                  img: 'assets/ic_luas.png'),
                            ],
                          )
                        ],
                      )),
                ],
              ),
              isFavorite == false
                  ? SizedBox()
                  : Positioned(
                      top: 10,
                      right: 10,
                      child: IgnorePointer(
                        ignoring: true,
                        child: FavoriteButton(
                          isFavorite: isFavorite,
                          projectCode: projectCode,
                        ),
                      )),
              Positioned(
                top: 10,
                left: 10,
                child: ChipBorder('${unit?.stock} Unit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
