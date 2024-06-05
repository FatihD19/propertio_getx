import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/modules/agen/views/detail_agen_view.dart';
import 'package:propertio_getx/app/shared/ui/components/pagination_button/pagination_button.dart';
import 'package:propertio_getx/app/shared/ui/components/search_form/search_form.dart';
import 'package:propertio_getx/app/shared/ui/components/sidebar.dart';
import 'package:propertio_getx/app/shared/ui/widgets/agent_card.dart';

import '../controllers/agen_controller.dart';

class AgenView extends GetView<AgenController> {
  bool? forDashboard;
  AgenView({Key? key, this.forDashboard}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Image.asset('assets/img_banner_agent.png'),
          SizedBox(height: 16),
          SearchForm(
              searchController: controller.searchAgentController.value,
              action: () {
                controller.fetchListAgentData(
                    search: controller.searchAgentController.value.text);
              }),
        ],
      );
    }

    Widget listAgent() {
      return Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Wrap(
                spacing: 20,
                runSpacing: 16,
                children: controller.listAgent.value.data!.agents!.map((agent) {
                  return GestureDetector(
                      onTap: () {
                        controller
                            .navigateToDetailAgent(agent.accountId.toString());
                      },
                      child: AgentCard(agent));
                }).toList(),
              ),
              NavigationButton(
                currentPage:
                    controller.listAgent.value.data!.pagination!.currentPage!,
                lastPage:
                    controller.listAgent.value.data!.pagination!.lastPage!,
                implementLogic: (page) {
                  print('Navigated to page $page');
                  controller.fetchListAgentData(page: page);
                },
                tag: 'agent',
              ),
            ],
          );
        }
      });
    }

    return Scaffold(
        appBar: forDashboard == true ? null : propertioAppBar(),
        drawer: forDashboard == true ? null : SideBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: RefreshIndicator.adaptive(
              onRefresh: () async {
                await controller.fetchListAgentData();
              },
              child: ListView(
                children: [
                  header(),
                  SizedBox(height: 16),
                  listAgent(),
                ],
              )),
        ));
  }
}
