import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/button.dart';
import 'package:propertio_getx/app/shared/ui/components/dropdown_type/dropdown_type.dart';
import 'package:propertio_getx/app/shared/ui/components/pagination_button/pagination_button.dart';
import 'package:propertio_getx/app/shared/ui/components/search_form/search_form.dart';
import 'package:propertio_getx/app/shared/ui/components/sidebar.dart';
import 'package:propertio_getx/app/shared/ui/widgets/proyek_card.dart';

import '../controllers/project_controller.dart';

class ProjectView extends GetView<ProjectController> {
  ProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Image.asset('assets/img_banner_proyek.jpeg')),
          SearchForm(
            searchController: controller.searchController.value,
            selectedItem: controller.selectedType.value,
            onChanged: (value) {
              controller.selectedType.value = value!;
            },
            action: () {
              controller.fetchProjectData(
                  query: controller.searchController.value.text,
                  type: controller.selectedType.value);
            },
          )
        ],
      );
    }

    Widget listProject() {
      return Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return controller.projectData.value!.data!.projects!.isEmpty
              ? Center(
                  child: Text('Data kosong',
                      style: primaryTextStyle.copyWith(fontSize: 16)))
              : Column(
                  children: [
                    Column(
                        children: controller.projectData.value!.data!.projects!
                            .map((proyek) {
                      return ProyekCard(proyek);
                    }).toList()),
                    NavigationButton(
                      currentPage: controller
                          .projectData.value!.data!.pagination!.currentPage!,
                      lastPage: controller
                          .projectData.value!.data!.pagination!.lastPage!,
                      implementLogic: (page) {
                        controller.fetchProjectData(page: page);
                      },
                      tag: 'project',
                    ),
                  ],
                );
        }
      });
    }

    return Scaffold(
        appBar: propertioAppBar(),
        drawer: SideBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          color: bgColor1,
          child: RefreshIndicator.adaptive(
            onRefresh: () async {
              controller.fetchProjectData(page: 1);
            },
            child: ListView(
              children: [
                header(),
                Obx(() {
                  return DropdownType(controller.selectedType.value, (value) {
                    controller.selectedType.value = value!;
                    print(value);
                    controller.fetchProjectData(
                        type: value,
                        query: controller.searchController.value.text);
                  });
                }),
                SizedBox(height: 16),
                listProject(),
              ],
            ),
          ),
        ));
  }
}
