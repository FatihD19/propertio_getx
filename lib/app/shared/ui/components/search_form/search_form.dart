import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/modules/project/controllers/project_controller.dart';
import 'package:propertio_getx/app/shared/ui/components/button.dart';
import 'package:propertio_getx/app/shared/ui/components/dropdown_type/dropdown_type.dart';

class SearchForm extends StatelessWidget {
  TextEditingController? searchController;
  String? selectedItem;
  void Function(String?)? onChanged;
  VoidCallback? action;
  SearchForm(
      {this.searchController, this.selectedItem, this.onChanged, this.action}) {
    Get.put(SearchFormController(
        actionSearch: action!,
        onChangedSelectedType: (value) {
          selectedItem = value;
          onChanged!(value);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(120),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: searchController,
              onSubmitted: (value) {
                action!();
              },
              decoration: InputDecoration(
                hintText: 'Cari Properti',
                border: InputBorder.none,
              ),
            ),
          ),
          // IconButton(
          //   icon: Icon(Icons.settings),
          //   onPressed: () {
          //     Get.find<SearchFormController>().modalFilterType();
          //   },
          // ),
        ],
      ),
    );
  }
}

class SearchFormController extends GetxController {
  var selectedType = 'Rumah';
  var searchController = TextEditingController();
  final VoidCallback actionSearch;
  void Function(String?)? onChangedSelectedType;

  SearchFormController(
      {required this.actionSearch, this.onChangedSelectedType});

  void search() {
    actionSearch();
  }

  void modalFilterType() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Column(
            children: [
              // DropdownType(selectedType, (value) {
              //   selectedType = value!;
              //   print(value);
              // }),
              SizedBox(height: 16),
              CustomButton(
                  text: 'cari',
                  onPressed: () {
                    print(selectedType);
                    onChangedSelectedType!(selectedType);
                    actionSearch();
                  })
            ],
          )
        ],
      ),
    ));
  }
}
