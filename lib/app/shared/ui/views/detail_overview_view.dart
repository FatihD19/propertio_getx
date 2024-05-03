import 'package:flutter/material.dart';
import 'package:propertio_getx/app/shared/ui/components/container_style.dart';
import 'package:propertio_getx/app/constants/theme.dart';

class DetailOverView extends StatelessWidget {
  String? status;
  bool? isProyek;
  String? propertiType;
  String? unitType;
  String? certificate;
  String? unitStock;
  String? buildYear;
  String? surfaceArea;
  String? buildingArea;
  String? bedRoom;
  String? bathRoom;
  String? garage;

  DetailOverView(
      {this.status,
      this.propertiType,
      this.unitType,
      this.certificate,
      this.unitStock,
      this.buildYear,
      this.isProyek,
      this.surfaceArea,
      this.buildingArea,
      this.bedRoom,
      this.bathRoom,
      this.garage,
      super.key});

  @override
  Widget build(BuildContext context) {
    Widget iconInfo(String image, String title, String value,
        {String? status}) {
      return status == 'rent'
          ? SizedBox()
          : Container(
              width: 145,
              child: Row(
                children: [
                  Image.asset(image),
                  SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: primaryTextStyle.copyWith(fontWeight: bold),
                      ),
                      Container(
                          width: 90,
                          child: Text(value, style: primaryTextStyle)),
                    ],
                  )
                ],
              ),
            );
    }

    return Container(
        padding: EdgeInsets.all(16),
        decoration: customBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overview',
                style:
                    primaryTextStyle.copyWith(fontSize: 19, fontWeight: bold)),
            SizedBox(height: 8),
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 16,
                children: isProyek == true
                    ? [
                        iconInfo('assets/ic_square_tipe.png', 'Tipe Properti',
                            '$propertiType'),
                        iconInfo(
                            'assets/ic_unitType.png', 'Tipe Unit', '$unitType'),
                        iconInfo(
                            'assets/ic_date.png', 'Dibangun', '$buildYear'),
                        iconInfo('assets/ic_availableUnit.png', 'Unit Tersedia',
                            '$unitStock Unit'),
                        iconInfo('assets/ic_square_sertif.png', 'Sertifikat',
                            '$certificate'),
                      ]
                    : [
                        iconInfo('assets/ic_square_tipe.png', 'Tipe Properti',
                            '$propertiType'),
                        iconInfo('assets/ic_square_luas.png', 'Luas',
                            ' ${buildingArea ?? 0} m2 / ${surfaceArea ?? 0} m2'),
                        iconInfo('assets/ic_square_bed.png', 'Kamar Tidur',
                            '${bedRoom ?? 0}'),
                        iconInfo('assets/ic_square_bath.png', 'Kamar Mandi',
                            '${bathRoom ?? 0}'),
                        iconInfo('assets/ic_square_car.png', 'Kendaraan',
                            '${garage ?? 0}'),
                        iconInfo('assets/ic_square_sertif.png', 'Sertifikat',
                            '$certificate',
                            status: status),
                      ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            )
          ],
        ));
  }
}
