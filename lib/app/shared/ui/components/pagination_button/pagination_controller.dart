import 'package:get/get.dart';

class PaginationController extends GetxController {
  final int lastPage;
  RxInt currentPage = 1.obs; // State yang reaktif
  final Function(int) implementLogic; // Fungsi kustom untuk logika

  PaginationController({
    required this.lastPage,
    required this.implementLogic,
  });

  void setPage(int page) {
    if (page >= 1 && page <= lastPage) {
      currentPage.value = page; // Update state
      implementLogic(page); // Jalankan fungsi logika kustom
    }
  }

  bool get isPreviousDisabled => currentPage.value <= 1;
  bool get isNextDisabled => currentPage.value >= lastPage;
}
