import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/shared/ui/components/button.dart';
import 'package:propertio_getx/app/shared/ui/components/dialog_view.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor1,
      padding: EdgeInsets.all(24),
      child: Center(
          child: CustomButton(
              text: 'Logout',
              onPressed: () {
                confirmDialog(
                    Get.overlayContext!, 'Logout', 'Apakah anda ingin Logout ?',
                    () {
                  AuthLocalDataSource.clearLocalStorage();
                  Get.offAllNamed('/login');
                });
              })),
    );
  }
}
