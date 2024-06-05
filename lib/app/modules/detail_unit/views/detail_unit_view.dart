import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/data/model/responses/detail_unit_response_model.dart';
import 'package:propertio_getx/app/shared/ui/components/button.dart';
import 'package:propertio_getx/app/shared/ui/components/text_failure.dart';
import 'package:propertio_getx/app/shared/ui/views/alamat_info_view.dart';
import 'package:propertio_getx/app/shared/ui/views/contact_us_detail.dart';
import 'package:propertio_getx/app/shared/ui/views/description_info_view.dart';
import 'package:propertio_getx/app/shared/ui/views/detail_info_view.dart';
import 'package:propertio_getx/app/shared/ui/views/detail_overview_view.dart';
import 'package:propertio_getx/app/shared/ui/views/facility_view.dart';
import 'package:propertio_getx/app/shared/ui/views/headline_properti_view.dart';
import 'package:propertio_getx/app/shared/ui/views/info_map_view.dart';
import 'package:propertio_getx/app/shared/ui/views/info_promo_view.dart';
import 'package:propertio_getx/app/shared/ui/views/infrastructure_view.dart';
import 'package:propertio_getx/app/shared/ui/views/video_view.dart';
import 'package:propertio_getx/app/shared/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/detail_unit_controller.dart';

class DetailUnitView extends GetView<DetailUnitController> {
  const DetailUnitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (controller.isError.value) {
        return Scaffold(
          body: Center(
            child: TextFailure(message: controller.errorMessage.value),
          ),
        );
      } else {
        DetailUnitModel detailUnit = controller.detailData.value.data!;
        String urlVideo = detailUnit.unitVideo == null
            ? ''
            : detailUnit.unitVideo!.link!.substring(
                detailUnit.unitVideo!.link!.length - 11,
                detailUnit.unitVideo!.link!.length);
        double pricePerArea =
            detailUnit.surfaceArea == '0' || detailUnit.price == '0'
                ? 0
                : double.parse(detailUnit.price!) /
                    double.parse(detailUnit.surfaceArea!);
        return Scaffold(
          body: Container(
            color: bgColor1,
            child: ListView(
              children: [
                InfoPromoCarousel(
                  detailUnit.unitPhotos!
                      .map((unitPhoto) => unitPhoto.filename.toString())
                      .toList(),
                  isVirtual: detailUnit.unitVirtualTour == null ? false : true,
                  virtualUrl: detailUnit.unitVirtualTour?.link,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    children: [
                      HeadlinePropertiView(
                          title: detailUnit.title.toString(),
                          rangePrice: detailUnit.price.toString(),
                          headline: detailUnit.title.toString(),
                          address: detailUnit.address,
                          countViews: detailUnit.countViews,
                          postedAt: detailUnit.postedAt,
                          shareUrl: ShareUrl.unit('${detailUnit.unitCode}')),
                      SizedBox(height: 16),
                      DetailOverView(
                        propertiType: detailUnit.propertyType!.name.toString(),
                        certificate: detailUnit.certificate,
                        surfaceArea: detailUnit.surfaceArea,
                        buildingArea: detailUnit.buildingArea,
                        bedRoom: detailUnit.bedroom,
                        bathRoom: detailUnit.bathroom,
                        garage: detailUnit.garage,
                      ),
                      SizedBox(height: 16),
                      DescriptionView(
                          description: detailUnit.description.toString()),
                      SizedBox(height: 16),
                      DetailInfoView(listInfo: [
                        RowTextInfo(
                            title: 'Kode Unit',
                            value: detailUnit.unitCode ?? '0'),
                        RowTextInfo(
                            title: 'Harga',
                            value:
                                formatCurrency('${detailUnit.price}') ?? '0'),
                        RowTextInfo(
                            title: 'Jumlah Lantai',
                            value: detailUnit.floor ?? '0'),
                        RowTextInfo(
                            title: 'Kamar Mandi',
                            value: detailUnit.bathroom ?? '0'),
                        RowTextInfo(
                            title: 'Daya Listrik',
                            value: detailUnit.powerSupply ?? ''),
                        RowTextInfo(
                            title: 'Teresdia', value: detailUnit.stock ?? '0'),
                        RowTextInfo(
                            title: 'Tipe Properti',
                            value: detailUnit.propertyType!.name ?? '0'),
                        RowTextInfo(
                            title: 'Sertifikat',
                            value: detailUnit.certificate ?? '0'),
                        RowTextInfo(
                            title: 'Luas Bangunan',
                            value: detailUnit.buildingArea ?? '0'),
                        RowTextInfo(
                            title: 'Kamar', value: detailUnit.bedroom ?? '0'),
                        RowTextInfo(
                            title: 'Tempat Parkir',
                            value: detailUnit.garage ?? '0'),
                        RowTextInfo(
                            title: 'Jenis Air',
                            value: detailUnit.waterType ?? ''),
                        RowTextInfo(
                            title: 'Interior',
                            value: detailUnit.interior ?? ''),
                      ]),
                      SizedBox(height: 16),
                      AlamatInfoView([
                        RowTextInfo(
                            title: 'Alamat Lengkap',
                            value: detailUnit.address!.address.toString()),
                        RowTextInfo(
                            title: 'Kode Pos',
                            value: detailUnit.address!.postalCode.toString()),
                        RowTextInfo(
                            title: 'Kota/Kabupaten',
                            value: detailUnit.address!.city.toString()),
                        RowTextInfo(
                            title: 'Kecamatan',
                            value: detailUnit.address!.district.toString()),
                        RowTextInfo(
                            title: 'Provinsi',
                            value: detailUnit.address!.province.toString()),
                      ]),
                      SizedBox(height: 16),
                      InfoMapView(
                          lantitude: detailUnit.address!.latitude.toString(),
                          longitude: detailUnit.address!.longitude.toString()),
                      SizedBox(height: 16),
                      FacilityView(detailUnit.projectFacilities!),
                      detailUnit.projectInfrastructure?.length == 0
                          ? SizedBox()
                          : InfrastructureView(
                              detailUnit.projectInfrastructure!),
                      // InfoMapView(isDenah: true,
                      // ),
                      // SizedBox(height: 16),
                      detailUnit.unitModel?.link == null
                          ? SizedBox()
                          : CustomButton(
                              text: '3D Model Unit',
                              icon: Icons.view_in_ar_outlined,
                              onPressed: () {
                                launchUrl(
                                    Uri.parse('${detailUnit.unitModel?.link}'));
                              }),
                      SizedBox(height: 16),
                      detailUnit.unitVideo == null
                          ? SizedBox()
                          : WebviewtubeDemo(urlVideo),
                      SizedBox(height: 16),
                      detailUnit.unitDocuments!.isEmpty
                          ? SizedBox()
                          : CustomButton(
                              text: 'Unduh Brosur',
                              icon: Icons.menu_book_rounded,
                              onPressed: () {
                                launchUrl(Uri.parse(ApiPath.image(detailUnit
                                    .unitDocuments!.first.filename
                                    .toString())));
                              }),

                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: ContactUsDetail(
              waMessasge: detailUnit.title,
              waNumber: detailUnit.developer?.phone,
              price: formatCurrency(detailUnit.price.toString()),
              surfaceArea: formatCurrency(pricePerArea.toInt().toString()),
              isUnit: true),
        );
      }
    });
  }
}
