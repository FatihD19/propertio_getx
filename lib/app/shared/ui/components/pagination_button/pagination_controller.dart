import 'package:get/get.dart';

class PaginationController extends GetxController {
  RxInt lastPage = 1.obs;
  RxInt currentPage = 1.obs; // State yang reaktif
  final Function(int) implementLogic; // Fungsi kustom untuk logika

  PaginationController({
    required this.currentPage,
    required this.lastPage,
    required this.implementLogic,
  });

  void setPage(int page) {
    currentPage.value = page; // Update state

    implementLogic(page); // Jalankan fungsi logika kustom

    update();
    // if (page >= 1 && page <= lastPage) {
    //   currentPage.value = page; // Update state

    //   implementLogic(page); // Jalankan fungsi logika kustom
    // }
  }

  bool get isPreviousDisabled => currentPage.value <= 1;
  bool get isNextDisabled => currentPage.value >= lastPage.value;
}
