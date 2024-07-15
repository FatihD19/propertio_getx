import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/data/datasource/auth_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/request/login_request_model.dart';
import 'package:propertio_getx/app/data/model/responses/login_response_model.dart';

class LoginController extends GetxController {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  LoginController(this._authRemoteDataSource, this._authLocalDataSource);

  var isLoading = false.obs;
  var isError = false.obs;
  var errorMessage = ''.obs;

  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  var loginResponse = Rxn<LoginResponseModel>();

  Future<void> validateLogin() async {
    await login();
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Email tidak boleh kosong');
    } else if (passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Password tidak boleh kosong');
    } else if (isError.value == true) {
      Get.snackbar('Error', errorMessage.value);
    } else {
      Get.offAllNamed('/dashboard');
    }
  }

  Future<void> login({LoginRequestModel? loginReq}) async {
    isLoading(true);
    final result = await _authRemoteDataSource.login(loginReq ??
        LoginRequestModel(
            email: emailController.text, password: passwordController.text));
    isLoading(false);

    result.fold(
      (left) async {
        errorMessage.value = left;
        isError(true);
      },
      (right) {
        loginResponse.value = right;
        isError(false);
      },
    );
  }

  Future<void> AuthGetCurrentUser() async {
    try {
      final LoginRequestModel data =
          await _authLocalDataSource.getCredentialFromLocal();
      print('${data.password} ${data.email}');
      await login(loginReq: data);
    } catch (e) {
      // Get.snackbar('Error', e.toString());
      isError(true);
    }
  }
}
