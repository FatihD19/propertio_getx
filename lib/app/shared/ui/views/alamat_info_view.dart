import 'package:flutter/material.dart';
import 'package:propertio_getx/app/shared/ui/components/container_style.dart';

class AlamatInfoView extends StatelessWidget {
  List<Widget> alamat;
  AlamatInfoView(this.alamat, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: customBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: alamat,
          ),
        ],
      ),
    );
  }
}
