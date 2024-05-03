import 'package:flutter/material.dart';
import 'package:propertio_getx/app/constants/theme.dart';

class CustomChip extends StatelessWidget {
  final String title;
  const CustomChip(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(title,
          style: buttonTextStyle.copyWith(fontSize: 10, fontWeight: bold)),
    );
  }
}

class ChipHouse extends StatelessWidget {
  String? title;
  ChipHouse({this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: secondaryColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Image.asset('assets/ic_house.png'),
          SizedBox(width: 4),
          Text(title ?? 'Rumah',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 10)),
        ],
      ),
    );
  }
}

class ChipBorder extends StatelessWidget {
  final String sertif;
  const ChipBorder(this.sertif, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: secondaryColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(sertif,
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 10)),
    );
  }
}
