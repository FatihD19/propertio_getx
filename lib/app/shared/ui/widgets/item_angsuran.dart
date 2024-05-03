import 'package:flutter/material.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/container_style.dart';

class ItemAngsuran extends StatelessWidget {
  String angsuran;
  String waktu;
  bool? isSelected;

  ItemAngsuran(this.angsuran, this.waktu, {this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customBoxDecoration(),
      width: 176,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ringkasan :',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 12)),
          SizedBox(height: 8),
          Text(angsuran,
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16)),
          SizedBox(height: 8),
          Text('Jangka Waktu : ',
              style: primaryTextStyle.copyWith(fontSize: 12)),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 46, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected == true ? Color(0xff219653) : Color(0xff2D9CDB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(waktu + ' Tahun',
                style:
                    buttonTextStyle.copyWith(fontWeight: bold, fontSize: 12)),
          )
        ],
      ),
    );
  }
}
