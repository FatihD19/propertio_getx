import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/properti_remote_datasource.dart';
import 'package:propertio_getx/app/shared/ui/components/dropdown_type/dropdown_type_controller.dart';

class DropdownType extends StatelessWidget {
  String? selectedItem;
  final void Function(String?)? onChanged;

  DropdownType(this.selectedItem, this.onChanged, {super.key}) {
    Get.put(PropertyTypeController(PropertiRemoteDataSource()));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = Get.find<PropertyTypeController>();

      return controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.isError.value
              ? Text(controller.errorMessage.value)
              : DropdownButton<String>(
                  isExpanded: true,
                  value: selectedItem,
                  items: controller.propertyTypeData.value.data!.map((item) {
                    return DropdownMenuItem<String>(
                      value: item.name.toString(),
                      child: Text(item.name.toString()),
                    );
                  }).toList(),
                  onChanged: onChanged,
                );
    });
  }
}
// Column(
//                   children: controller.propertyTypeData.value.data!.map((item) {
//                     return Text(item.name.toString());
//                   }).toList(),
//                 );