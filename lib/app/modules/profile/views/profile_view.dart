import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/api_path.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/profil_response_model.dart';
import 'package:propertio_getx/app/shared/ui/components/button.dart';
import 'package:propertio_getx/app/shared/ui/components/container_style.dart';
import 'package:propertio_getx/app/shared/ui/components/dialog_view.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget infoRow(String img, String title) {
      return Container(
        margin: EdgeInsets.only(bottom: 4),
        child: Row(
          children: [
            Image.asset(img, width: 16, height: 16),
            SizedBox(width: 4),
            Text(title, style: primaryTextStyle.copyWith(fontSize: 12)),
          ],
        ),
      );
    }

    Widget infoProfile() {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: customBoxDecoration(),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.isError.value) {
            return Center(child: Text(controller.errorMessage.value));
          }
          UserData? profile = controller.profileData.value.data?.userData!;
          return Column(
            children: [
              profile?.pictureProfile == null
                  ? CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 100,
                      ),
                    )
                  : CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        ApiPath.image('${profile?.pictureProfile}'),
                        scale: 1.0,
                      ),
                      // child: Image.network(
                      //   ApiPath.image('${profile?.pictureProfile}'),
                      //   width: 100,
                      //   height: 100,
                      //   fit: BoxFit.cover,
                      //   errorBuilder: (context, error, stackTrace) {
                      //     return CircleAvatar(
                      //       backgroundColor: Colors.black,
                      //       child: Icon(
                      //         Icons.person_outline_rounded,
                      //         size: 24,
                      //       ),
                      //     );
                      //   },
                      // ),
                    ),
              Text('${profile?.fullName}',
                  style: primaryTextStyle.copyWith(
                      fontWeight: bold, fontSize: 16)),
              SizedBox(height: 8),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 4),
                    Column(
                      children: [
                        infoRow('assets/ic_mail.png',
                            '${controller.profileData.value.data?.email}'),
                        infoRow('assets/ic_mini_call.png', '${profile?.phone}'),
                        infoRow('assets/ic_location.png',
                            '${profile?.city}, ${profile?.province}'),
                      ],
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
              SizedBox(height: 4),
              // CustomButton(
              //     text: 'Edit Profil',
              //     icon: Icons.mode_edit_outline_outlined,
              //     color: Color(0xff949494),
              //     onPressed: () {
              //       // showCustomSnackbar(context, ModalEditProfile(state.data));
              //     }),

              // gantiPassword(),
            ],
          );
        }),
      );
    }

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        color: bgColor1,
        child: ListView(
          children: [
            infoProfile(),
            SizedBox(height: 16),
            CustomButton(
                text: 'Logout',
                onPressed: () {
                  confirmDialog(Get.overlayContext!, 'Logout',
                      'Apakah anda ingin Logout ?', () {
                    AuthLocalDataSource.clearLocalStorage();
                    Get.offAllNamed('/login');
                  });
                })
          ],
        ));
  }
}
