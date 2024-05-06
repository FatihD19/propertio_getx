import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/data/model/responses/detail_project_response_model.dart';
import 'package:propertio_getx/app/data/model/unit_model.dart';
import 'package:propertio_getx/app/shared/ui/views/headline_properti_view.dart';
import 'package:propertio_getx/app/shared/ui/widgets/small_proyek_card.dart';

import '../controllers/detail_project_controller.dart';

class DetailProjectView extends GetView<DetailProjectController> {
  const DetailProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget listUnit(
        List<UnitModel> listUnit, String projectCode, bool isFavorite) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Daftar Unit',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16)),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: listUnit
                  .map((unit) => SmallProyekCardUnit(
                        unit: unit,
                        isFavorite: isFavorite,
                        projectCode: projectCode,
                      ))
                  .toList(),
            ),
          ),
        ],
      );
    }

    return Obx(() {
      if (controller.isLoading.value) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        return Scaffold(
          body: Container(
            color: bgColor1,
            child: ListView(children: [
              // InfoPromoCarousel(
              //     state.projectModel.data!.projectPhotos!
              //         .map((projectPhoto) => projectPhoto.filename.toString())
              //         .toList(),
              //     isVirtual: proyek.projectVirtualTour == null ? false : true,
              //     virtualUrl: '${proyek.projectVirtualTour?.link}'),
              // Text('${cheapestUnit.price} - ${mostExpensiveUnit.price}'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    HeadlinePropertiView(
                      isProyek: true,
                      // rangePrice: cheapestUnit.price == mostExpensiveUnit.price
                      //     ? '${formatCurrency(cheapestUnit.price ?? '0')}'
                      //     : '${formatCurrency(cheapestUnit.price ?? '0')} - ${formatCurrency(mostExpensiveUnit.price ?? '0')}',
                      title: controller.detailData.value.data!.title.toString(),
                      headline:
                          controller.detailData.value.data!.headline.toString(),
                      address: controller.detailData.value.data!.address,
                      countViews: controller.detailData.value.data!.countViews,
                      // shareUrl: ShareUrl.project(slug),
                      postedAt: controller.detailData.value.data!.postedAt,
                      isFavorite: controller.detailData.value.data!.isFavorites,
                      projectCode:
                          controller.detailData.value.data!.projectCode,
                    ),
                    // SizedBox(height: 16),
                    // DetailOverView(
                    //     isProyek: true,
                    //     propertiType: proyek.propertyType?.name.toString(),
                    //     unitType: proyek.unitType.toString(),
                    //     certificate: proyek.certificate.toString(),
                    //     unitStock: proyek.unitStock.toString(),
                    //     buildYear: proyek.completedAt.toString()),
                    // SizedBox(height: 16),
                    // DescriptionView(description: proyek.description.toString()),
                    // SizedBox(height: 16),
                    // DetailInfoView(listInfo: [
                    //   RowTextInfo(
                    //       title: 'Proyek Kode',
                    //       value: proyek.projectCode.toString()),
                    //   RowTextInfo(
                    //       title: 'Proyek Dibangun',
                    //       value: proyek.completedAt.toString()),
                    //   RowTextInfo(
                    //       title: 'Tipe Unit', value: proyek.unitType.toString()),
                    //   RowTextInfo(
                    //       title: 'Tipe Properti',
                    //       value: proyek.propertyType!.name.toString()),
                    //   RowTextInfo(
                    //       title: 'Sertifikat',
                    //       value: proyek.certificate.toString()),
                    //   RowTextInfo(
                    //       title: 'Unit Tersedia',
                    //       value: proyek.unitStock.toString()),
                    // ]),
                    // SizedBox(height: 16),
                    // AlamatInfoView([
                    //   RowTextInfo(
                    //       title: 'Alamat Lengkap',
                    //       value: proyek.address!.address.toString()),
                    //   RowTextInfo(
                    //       title: 'Kode Pos',
                    //       value: proyek.address!.postalCode.toString()),
                    //   RowTextInfo(
                    //       title: 'Kota/Kabupaten',
                    //       value: proyek.address!.city.toString()),
                    //   RowTextInfo(
                    //       title: 'Kecamatan',
                    //       value: proyek.address!.district.toString()),
                    //   RowTextInfo(
                    //       title: 'Provinsi',
                    //       value: proyek.address!.province.toString()),
                    // ]),
                    // SizedBox(height: 16),
                    // InfoMapView(
                    //     lantitude: proyek.address!.latitude.toString(),
                    //     longitude: proyek.address!.longitude.toString()),
                    // SizedBox(height: 16),
                    // listUnit(state.projectModel.data?.units?.data ?? [],
                    //     '${proyek.projectCode}', proyek.isFavorites!),
                    // SizedBox(height: 16),
                    // InfoMapView(
                    //   isDenah: true,
                    //   urlImg: proyek.siteplanImage,
                    // ),
                    // SizedBox(height: 16),
                    // CustomButton(
                    //     text: 'Unduh Brosur',
                    //     icon: Icons.menu_book_rounded,
                    //     onPressed: () {
                    //       launchUrl(Uri.parse(ApiPath.image(
                    //           proyek.projectDocuments!.first.filename.toString())));
                    //     }),
                    // SizedBox(height: 16),
                    // PromoArApp(),
                    // SizedBox(height: 16),
                    // proyek.projectVideo == null
                    //     ? SizedBox()
                    //     : WebviewtubeDemo(urlVideo),
                    // SizedBox(height: 16),
                    // ListileDeveloper(
                    //     developer: proyek.developer,
                    //     onTap: () {
                    //       showCustomSnackbar(
                    //           context,
                    //           ModalInformasi(
                    //               developer: proyek.developer!,
                    //               projectCode: proyek.projectCode),
                    //           type: 'info');
                    //     })
                  ],
                ),
              ),
            ]),
          ),
          // bottomNavigationBar: ContactUsDetail(
          //     waMessasge: proyek.title,
          //     waNumber: proyek.developer?.phone.toString(),
          //     isProyek: true,
          //     price: cheapestUnit.price == mostExpensiveUnit.price
          //         ? '${formatCurrency(cheapestUnit.price ?? '0')}'
          //         : '${formatCurrency(cheapestUnit.price ?? '0')} - ${formatCurrency(mostExpensiveUnit.price ?? '0')}'),
        );
      }
    });
  }
}
