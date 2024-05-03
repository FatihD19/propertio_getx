import 'package:flutter/material.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/data/model/properti_model.dart';

import 'package:propertio_getx/app/shared/ui/components/button.dart';
import 'package:propertio_getx/app/shared/ui/components/container_style.dart';

import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/custom_chip.dart';
import 'package:propertio_getx/app/shared/ui/components/favorite_button/favorite_button.dart';
import 'package:propertio_getx/app/shared/ui/components/text_price.dart';
import 'package:propertio_getx/app/shared/utils.dart';

import 'package:shimmer/shimmer.dart';

class PropertiCard extends StatelessWidget {
  bool? hideAgent;
  bool? isFavorite;
  final PropertiModel properti;
  bool? marginRight;
  PropertiCard(this.properti,
      {this.isFavorite = false,
      this.hideAgent = false,
      this.marginRight = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    bool isRent = properti.listingType == 'rent';
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             DetailPropertiPage(properti.slug.toString())));
      },
      child: Card(
        margin: marginRight == true
            ? EdgeInsets.only(bottom: 16, right: 16)
            : EdgeInsets.only(bottom: 16),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
            width: 345,
            decoration: customBoxDecoration(),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: properti.photo.toString() == 'null'
                            ? Image.asset('assets/img_properti.png',
                                height: 280)
                            : Image.network(
                                ApiPath.image(properti.photo.toString()),
                                fit: BoxFit.cover,
                                height: 280,
                                width: double.infinity,
                                loadingBuilder: (context, child, progress) {
                                  return progress == null
                                      ? child
                                      : Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            height: 280,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xffF3F3F3),
                                            ),
                                          ),
                                        );
                                },
                              )),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            child: Text(properti.headline.toString(),
                                style: primaryTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                )),
                          ),
                          Text(
                            '${properti.address?.district}, ${properti.address?.city}, ${properti.address?.province}',
                            style: secondaryTextStyle.copyWith(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              isRent
                                  ? Row(
                                      children: [
                                        TextPrice(properti.price.toString()),
                                        Text(' per tahun')
                                      ],
                                    )
                                  : TextPrice(properti.price.toString()),
                              // Text(formatCurrency(properti.price.toString()),
                              //     style: thirdTextStyle.copyWith(
                              //         fontWeight: bold, fontSize: 16)),
                              Row(children: [
                                Facility(
                                    value:
                                        properti.bathroom.toString() == 'null'
                                            ? '0'
                                            : properti.bathroom.toString(),
                                    img: 'assets/ic_bed.png'),
                                Facility(
                                    value: properti.bedroom.toString() == 'null'
                                        ? '0'
                                        : properti.bedroom.toString(),
                                    img: 'assets/ic_bath.png'),
                                Facility(
                                    value: properti.area.toString() == 'null'
                                        ? '0'
                                        : properti.area.toString(),
                                    img: 'assets/ic_luas.png'),
                              ])
                            ],
                          ),
                          SizedBox(height: 8),
                          hideAgent == true
                              ? SizedBox()
                              : Column(
                                  children: [
                                    Container(
                                      color: secondaryColor,
                                      height: 1,
                                      child: SizedBox(width: double.infinity),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  ApiPath.image(properti
                                                      .agent!.pictureProfileFile
                                                      .toString())),
                                            ),
                                            SizedBox(width: 8),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    properti.agent!.fullName
                                                        .toString(),
                                                    style: primaryTextStyle
                                                        .copyWith(
                                                            fontWeight: bold,
                                                            fontSize: 12)),
                                                Text(
                                                    'Aktif ${calculateTimeDifference(properti.postedAt.toString())}',
                                                    style: secondaryTextStyle
                                                        .copyWith(fontSize: 10))
                                              ],
                                            )
                                          ],
                                        ),
                                        FavoriteButton(
                                            propertyCode: properti.propertyCode,
                                            isFavorite: properti.isFavorites),
                                      ],
                                    ),
                                  ],
                                ),
                          isFavorite == false
                              ? SizedBox()
                              : Column(
                                  children: [
                                    SizedBox(height: 8),
                                    CustomButton(
                                        text: 'Hapus dari Favorit',
                                        icon: Icons.delete,
                                        onPressed: () {
                                          // confirmDialog(
                                          //     context,
                                          //     'Hapus dari favorit',
                                          //     'Apakah anda yakin ingin menghapus dari favorit?',
                                          //     () {
                                          //   context.read<FavoriteBloc>().add(
                                          //         OnDeleteFavorite(
                                          //           propertyCode:
                                          //               properti.propertyCode,
                                          //         ),
                                          //       );

                                          //   showMessageModal(context, 'Sukses',
                                          //       color: Colors.green);

                                          //   context.read<FavoriteBloc>().add(
                                          //       OnGetFavoriteProperty(page: 1));
                                          // });
                                        }),
                                  ],
                                )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: Row(
                      children: [
                        CustomChip(isRent ? 'Sewa' : 'Jual'),
                        properti.listingType == 'rent'
                            ? SizedBox()
                            : ChipBorder(properti.certificate.toString()),
                        ChipHouse(
                          title: properti.propertyType!.name.toString(),
                        )
                      ],
                    )),
                hideAgent == true
                    ? Positioned(
                        top: 10,
                        right: 10,
                        child: FavoriteButton(
                            propertyCode: properti.propertyCode,
                            isFavorite: properti.isFavorites))
                    : SizedBox()
              ],
            )),
      ),
    );
  }
}

class Facility extends StatelessWidget {
  final String value;
  final String img;
  Facility({
    required this.value,
    required this.img,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: Row(
        children: [
          Image.asset(img),
          SizedBox(width: 2),
          Text(value, style: primaryTextStyle.copyWith(fontSize: 12))
        ],
      ),
    );
  }
}
