import 'package:flutter/material.dart';

import 'package:propertio_getx/app/data/model/responses/detail_project_response_model.dart';

import 'package:propertio_getx/app/constants/theme.dart';

class InfrastructureView extends StatelessWidget {
  final List<ProjectInfrastructure> infrastructure;
  InfrastructureView(this.infrastructure, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget itemFacility(String tipe, String title) {
      return Container(
        child: Row(
          children: [
            Icon(Icons.business_outlined),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tipe,
                    style: primaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold)),
                Container(
                    child: Text(title,
                        style: primaryTextStyle.copyWith(fontSize: 12))),
              ],
            ),
          ],
        ),
      );
    }

    Widget listFacility() {
      return Wrap(
        spacing: 15,
        runSpacing: 16,
        children: infrastructure
            .map((infrastructure) => itemFacility(
                infrastructure.type.toString(), infrastructure.name.toString()))
            .toList(),
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Infrastruktur',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          listFacility(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
