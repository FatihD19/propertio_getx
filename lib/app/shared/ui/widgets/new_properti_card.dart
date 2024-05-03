import 'package:flutter/material.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/data/model/proyek_model.dart';

import 'package:propertio_getx/app/shared/ui/components/container_style.dart';

import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/custom_chip.dart';
import 'package:propertio_getx/app/shared/ui/components/favorite_button/favorite_button.dart';
import 'package:propertio_getx/app/shared/ui/components/text_price.dart';
import 'package:propertio_getx/app/shared/utils.dart';

class NewPropertiCard extends StatelessWidget {
  final ProjectModel propertiBaru;
  NewPropertiCard(this.propertiBaru, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             DetailProyekPage(propertiBaru.slug.toString())));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: customBoxDecoration(),
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 135,
                        width: 135,
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: secondaryColor, width: 1)),
                        child: propertiBaru.photo == null
                            ? Image.asset('assets/img_new_properti.png')
                            : Image.network(
                                ApiPath.image(propertiBaru.photo.toString()),
                                height: 135,
                                width: 135,
                                fit: BoxFit.cover,
                                // errorBuilder: (context, error, stackTrace) {
                                //   return Icon(Icons.error);
                                // },
                              ),
                      ),
                      Positioned(
                          top: 5, left: 5, child: CustomChip('Properti Baru')),
                      Positioned(
                          bottom: 5,
                          left: 5,
                          child: Row(
                            children: [
                              ChipHouse(
                                  title: propertiBaru.propertyType!.name
                                      .toString()),
                              ChipBorder(propertiBaru.certificate.toString())
                            ],
                          ))
                    ],
                  ),
                  SizedBox(width: 13),
                  Container(
                    width: 172,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(propertiBaru.title.toString(),
                              style: primaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              )),
                        ),
                        SizedBox(height: 4),
                        Container(
                          child: Text(
                            '${propertiBaru.address?.city}, ${propertiBaru.address?.province}',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            ChipBorder('${propertiBaru.countUnit} tipe unit'),
                            ChipBorder('${propertiBaru.stockUnit} unit'),
                            ChipBorder(propertiBaru.completedAt.toString()),
                          ],
                        ),
                        SizedBox(height: 4),
                        Container(
                          child: Text(
                            propertiBaru.headline.toString(),
                            style: primaryTextStyle.copyWith(fontSize: 10),
                          ),
                        ),
                        TextPrice(propertiBaru.price.toString()),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Container(
                color: secondaryColor,
                height: 1,
                child: SizedBox(width: double.infinity),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(ApiPath.image(propertiBaru
                            .developer!.pictureProfileFile
                            .toString())),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(propertiBaru.developer!.fullName.toString(),
                              style: primaryTextStyle.copyWith(
                                  fontWeight: bold, fontSize: 12)),
                          Row(
                            children: [
                              Image.asset('assets/img_calendar.png'),
                              SizedBox(width: 4),
                              Text(
                                  'Iklan diposting ${calculateTimeDifference(propertiBaru.postedAt.toString())}',
                                  style:
                                      primaryTextStyle.copyWith(fontSize: 10))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  FavoriteButton(
                    isFavorite: propertiBaru.isFavorites,
                    projectCode: propertiBaru.projectCode,
                  )
                ],
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/img_agent.png'),
                ),
                title: Text('City Connoisseurs',
                    style: primaryTextStyle.copyWith(
                        fontWeight: bold, fontSize: 12)),
                subtitle: Row(
                  children: [
                    Image.asset('assets/img_calendar.png'),
                    SizedBox(width: 4),
                    Text('Iklan diposting 1 tahun lalu',
                        style: primaryTextStyle.copyWith(fontSize: 10))
                  ],
                ),
                trailing: FavoriteButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
