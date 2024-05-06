// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/data/model/proyek_model.dart';
import 'package:propertio_getx/app/routes/app_pages.dart';

import 'package:propertio_getx/app/shared/ui/components/button.dart';
import 'package:propertio_getx/app/shared/ui/components/container_style.dart';

import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/custom_chip.dart';
import 'package:propertio_getx/app/shared/ui/components/favorite_button/favorite_button.dart';
import 'package:propertio_getx/app/shared/ui/components/text_price.dart';

class ProyekCard extends StatelessWidget {
  bool? hideAgent;
  bool? isFavorite;
  final ProjectModel proyek;
  VoidCallback? onDelete;
  ProyekCard(this.proyek,
      {this.isFavorite = false,
      this.hideAgent = false,
      this.onDelete,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_PROJECT, arguments: proyek.slug);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Card(
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
                  children: [
                    proyek.photo.toString() == 'null'
                        ? Image.asset('assets/img_properti.png')
                        : Image.network(
                            ApiPath.image(proyek.photo.toString()),
                            height: 160,
                            width: 345,
                            fit: BoxFit.cover,
                          ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            proyek.title.toString(),
                            style: primaryTextStyle.copyWith(
                                fontSize: 14, fontWeight: bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${proyek.address?.district}, ${proyek.address?.city}, ${proyek.address?.province}',
                            style: secondaryTextStyle.copyWith(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),
                          Text(
                            proyek.headline.toString(),
                            style: primaryTextStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),
                          TextPrice(proyek.price.toString()),
                          SizedBox(height: 8),
                          isFavorite == false
                              ? SizedBox()
                              : CustomButton(
                                  text: 'Hapus dari Favorit',
                                  icon: Icons.delete,
                                  onPressed: () {
                                    onDelete!();
                                    // confirmDialog(context, 'Hapus dari favorit',
                                    //     'Apakah anda yakin ingin menghapus dari favorit?',
                                    //     () {
                                    //   context.read<FavoriteBloc>().add(
                                    //         OnDeleteFavorite(
                                    //           projectCode: proyek.projectCode,
                                    //         ),
                                    //       );

                                    //   showMessageModal(context, 'Sukses',
                                    //       color: Colors.green);

                                    //   context
                                    //       .read<FavoriteBloc>()
                                    //       .add(OnGetFavoriteProject(page: 1));
                                    // });
                                  })
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: Row(
                      children: [
                        CustomChip('2020'),
                        ChipBorder(proyek.certificate.toString()),
                        ChipHouse(
                          title: proyek.propertyType!.name.toString(),
                        )
                      ],
                    )),
                Positioned(
                  top: 10,
                  right: 10,
                  child: FavoriteButton(
                    isFavorite: proyek.isFavorites,
                    projectCode: proyek.projectCode,
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 10,
                  child: ChipHouse(),
                ),
                hideAgent == true
                    ? SizedBox()
                    : Positioned(
                        top: 120,
                        right: 15,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            ApiPath.image(
                                '${proyek.developer?.pictureProfileFile}'),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
