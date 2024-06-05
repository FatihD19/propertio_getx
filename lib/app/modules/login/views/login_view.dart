import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/modules/dashboard/views/dashboard_view.dart';
import 'package:propertio_getx/app/shared/ui/components/button.dart';
import 'package:propertio_getx/app/shared/ui/components/textfieldForm.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/lg_propertio.jpg',
                width: 25,
                height: 33,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                'Propertio',
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text('Selamat Datang',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 32)),
          SizedBox(height: 8),
          Text('Mari Segera Bergabung',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16)),
          SizedBox(height: 8),
          Image.asset(
            'assets/img_propertio_ilus.png',
            width: 220,
            height: 177,
          ),
        ],
      );
    }

    Widget passwordInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kata Sandi*",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            PasswordField(
                passontroller: controller.passwordController,
                hintText: 'Masukan Kata Sandi')
          ],
        ),
      );
    }

    Widget form() {
      return Column(
        children: [
          CustomTextField(
            controller: controller.emailController,
            title: 'Email',
            mandatory: true,
            hintText: 'Masukan Email Anda',
          ),
          passwordInput()
        ],
      );
    }

    Widget actionBtn() {
      return Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('Tidak dapat mengingat kata sandi anda?',
          //         style: primaryTextStyle.copyWith(fontSize: 12)),
          //     TextButton(
          //       onPressed: () {},
          //       child: Text('Klik disini',
          //           style: thirdTextStyle.copyWith(fontSize: 12)),
          //     )
          //   ],
          // ),
          SizedBox(height: 24),
          Obx(() {
            if (controller.isLoading.value) {
              return CircularProgressIndicator();
            } else {
              return CustomButton(
                  text: 'Masuk Sekarang',
                  onPressed: () {
                    controller.validateLogin();
                  });
            }
          }),
          SizedBox(height: 8),
          GestureDetector(
              onTap: () {
                Get.offAllNamed('/dashboard');
              },
              child:
                  Text('Lewati', style: thirdTextStyle.copyWith(fontSize: 12))),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('Belum memiliki akun?',
          //         style: primaryTextStyle.copyWith(fontSize: 12)),
          //     TextButton(
          //       onPressed: () {
          //         Get.to(() => VerisonPage());
          //       },
          //       child: Text('Klik disini',
          //           style: thirdTextStyle.copyWith(fontSize: 12)),
          //     )
          //   ],
          // ),
        ],
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            header(),
            form(),
            actionBtn(),
          ],
        ),
      ),
    );
  }
}
