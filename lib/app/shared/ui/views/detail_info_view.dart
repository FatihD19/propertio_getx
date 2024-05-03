import 'package:flutter/material.dart';
import 'package:propertio_getx/app/shared/ui/components/container_style.dart';
import 'package:propertio_getx/app/constants/theme.dart';

class DetailInfoView extends StatefulWidget {
  List<Widget> listInfo;
  DetailInfoView({required this.listInfo, super.key});

  @override
  State<DetailInfoView> createState() => _DetailInfoViewState();
}

class _DetailInfoViewState extends State<DetailInfoView> {
  bool isExpanded = false;
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
              Text(
                'Detail',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: buttonTextColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Column(
            children: !isExpanded && widget.listInfo.length > 3
                ? widget.listInfo.sublist(0, 3)
                : widget.listInfo,
          ),
        ],
      ),
    );
  }
}

class RowTextInfo extends StatelessWidget {
  final String title;
  final String value;
  const RowTextInfo({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 96,
          child: Text(
            title,
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
        ),
        Text(
          ' :',
          style: primaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: semiBold,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: 200,
          child: Text(
            value,
            style: primaryTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
        ),
      ],
    );
  }
}
