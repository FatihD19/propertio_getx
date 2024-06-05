import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/data/model/agent_model.dart';
import 'package:propertio_getx/app/modules/agen/bindings/agen_binding.dart';
import 'package:propertio_getx/app/modules/agen/views/detail_agen_view.dart';
import 'package:propertio_getx/app/shared/ui/components/container_style.dart';

import 'package:shimmer/shimmer.dart';

class AgentCard extends StatelessWidget {
  final AgentModel agent;
  bool? useMargin;
  AgentCard(this.agent, {this.useMargin, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: useMargin == true
          ? EdgeInsets.only(right: 16, top: 4, bottom: 4)
          : EdgeInsets.all(0),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 163,
        decoration: customBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.network(
                ApiPath.image(agent.pictureProfileFile.toString()),
                fit: BoxFit.cover,
                width: 163,
                height: 126,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/img_agent.png');
                },
                loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 163,
                            height: 126,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffF3F3F3),
                            ),
                          ),
                        );
                },
              ),
            ),
            Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      agent.fullName.toString(),
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(' ${agent.city}, ${agent.province}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: secondaryTextStyle.copyWith(fontSize: 12)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
