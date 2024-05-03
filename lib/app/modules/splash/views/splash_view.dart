import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView() {
    Get.find<SplashController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 330,
          height: 350,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/lg_propertio.jpg'))),
        ),
      ),
    );
  }
}
