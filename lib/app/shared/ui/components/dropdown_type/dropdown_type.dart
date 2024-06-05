import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/data/datasource/properti_remote_datasource.dart';
import 'package:propertio_getx/app/shared/ui/components/dropdown_type/dropdown_type_controller.dart';

class DropdownType extends StatelessWidget {
  String? selectedItem;
  final void Function(String?)? onChanged;

  DropdownType(this.selectedItem, this.onChanged, {super.key}) {
    Get.put(PropertyTypeController(PropertiRemoteDataSource()),
        permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = Get.find<PropertyTypeController>();

      return controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.isError.value
              ? Text(controller.errorMessage.value)
              : Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xFF79747E),
                    ),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                    style: primaryTextStyle.copyWith(fontSize: 16),
                    isExpanded: true,
                    value: selectedItem,
                    items: controller.propertyTypeData.value.data!.map((item) {
                      return DropdownMenuItem<String>(
                        value: item.name.toString(),
                        child: Text(item.name.toString()),
                      );
                    }).toList(),
                    onChanged: onChanged,
                  ),
                );
    });
  }
}
// Column(
//                   children: controller.propertyTypeData.value.data!.map((item) {
//                     return Text(item.name.toString());
//                   }).toList(),
//                 );