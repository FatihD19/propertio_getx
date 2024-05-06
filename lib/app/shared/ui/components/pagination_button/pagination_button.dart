import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/pagination_button/pagination_controller.dart';

class NavigationButton extends StatelessWidget {
  String? tag;
  int? currentPage;
  int? lastPage;
  final Function(int) implementLogic; // Fungsi custom logic

  NavigationButton(
      {required this.currentPage,
      required this.lastPage,
      required this.implementLogic,
      this.tag});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = Get.put(
        PaginationController(
          currentPage: RxInt(currentPage!),
          lastPage: RxInt(lastPage!),
          implementLogic: implementLogic,
        ),
        tag: tag,
      ); // Inject controller dengan implementLogic;

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: controller.isPreviousDisabled
                    ? null
                    : () =>
                        controller.setPage(controller.currentPage.value - 1),
              ),
              const SizedBox(width: 10),
              Row(
                children: List.generate(
                  lastPage!,
                  (index) => ElevatedButton(
                    onPressed: () => controller.setPage(index + 1),
                    child: Text(
                      '${index + 1}',
                      style: currentPage == index + 1
                          ? TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )
                          : TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize: const Size(50, 50),
                      backgroundColor:
                          currentPage == index + 1 ? primaryColor : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: controller.isNextDisabled
                    ? null
                    : () =>
                        controller.setPage(controller.currentPage.value + 1),
              ),
            ],
          ),
        ),
      );
    });
  }
}
// class NavigationButton extends StatefulWidget {
//   final int lastPage;
//   int? currentPage;
//   final Function(int) implementLogic;

//   NavigationButton(
//       {required this.lastPage, this.currentPage, required this.implementLogic});

//   @override
//   _NavigationButtonState createState() => _NavigationButtonState();
// }

// class _NavigationButtonState extends State<NavigationButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.symmetric(vertical: 16),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: widget.currentPage == 1
//                     ? null
//                     : () => setPage(widget.currentPage! - 1),
//               ),
//               SizedBox(width: 10),
//               Container(
//                 margin: EdgeInsets.only(bottom: 4),
//                 child: Row(
//                   children: List.generate(
//                     widget.lastPage,
//                     (index) => ElevatedButton(
//                       onPressed: () => setPage(index + 1),
//                       child: Text('${index + 1}',
//                           style: widget.currentPage == index + 1
//                               ? buttonTextStyle
//                               : primaryTextStyle),
//                       style: ElevatedButton.styleFrom(
//                         shape: CircleBorder(),
//                         minimumSize: Size(50, 50),
//                         backgroundColor: widget.currentPage == index + 1
//                             ? primaryColor
//                             : null,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10),
//               IconButton(
//                 icon: Icon(Icons.arrow_forward),
//                 onPressed: widget.currentPage == widget.lastPage
//                     ? null
//                     : () => setPage(widget.currentPage! + 1),
//               ),
//             ],
//           ),
//         ));
//   }

//   void setPage(int page) {
//     setState(() {
//       widget.currentPage = page;
//     });
//     widget.implementLogic(page); // Call custom logic function
//   }
// }

