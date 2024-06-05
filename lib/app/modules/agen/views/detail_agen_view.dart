import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/data/datasource/agent_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/properti_model.dart';
import 'package:propertio_getx/app/data/model/responses/detail_agent_response_model.dart';
import 'package:propertio_getx/app/modules/agen/controllers/agen_controller.dart';
import 'package:propertio_getx/app/shared/ui/views/detail_info_agen_view.dart';
import 'package:propertio_getx/app/shared/ui/widgets/properti_card.dart';

class DetailAgenView extends StatelessWidget {
  final String id = Get.arguments;
  DetailAgenView({super.key});
  @override
  Widget build(BuildContext context) {
    final agenController = Get.find<AgenController>();

    return Scaffold(
      body: Obx(() {
        if (agenController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          List<PropertiModel> listProperti =
              agenController.detailAgent.value.data!.properties!.data!;
          DataDetailAgent data = agenController.detailAgent.value.data!;
          return ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailInfoAgenView(
                      data.fullName.toString(),
                      data.phone.toString(),
                      data.pictureProfileFile.toString(),
                      data.city.toString(),
                      data.province.toString()),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Daftar Properti',
                            style: primaryTextStyle.copyWith(
                                fontWeight: bold, fontSize: 16)),
                        SizedBox(height: 16),
                        Center(
                          child: listProperti.isEmpty
                              ? Text('Tidak terdapat Properti',
                                  style: primaryTextStyle.copyWith(
                                      fontWeight: bold, fontSize: 16))
                              : Column(
                                  children: listProperti
                                      .map((properti) => PropertiCard(properti,
                                          hideAgent: true))
                                      .toList(),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        }
      }),
    );
  }
}
