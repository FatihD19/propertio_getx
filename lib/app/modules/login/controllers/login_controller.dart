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

  void validateLogin() {
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Email tidak boleh kosong');
    } else if (passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Password tidak boleh kosong');
    } else {
      login();
    }
  }

  Future<void> login({LoginRequestModel? loginReq}) async {
    isLoading(true);
    final result = await _authRemoteDataSource.login(loginReq ??
        LoginRequestModel(
            email: emailController.text, password: passwordController.text));
    isLoading(false);

    result.fold(
      (left) {
        errorMessage.value = left;
        isError(true);
        Get.snackbar('Error', left);
      },
      (right) {
        Get.offAllNamed('/dashboard');
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
      final result = await _authRemoteDataSource.login(data);
      result.fold(
        (left) {
          errorMessage.value = left;
          isError(true);
          Get.snackbar('Error', left);
          Get.offAllNamed('/login');
        },
        (right) {
          Get.offAllNamed('/dashboard');
          isError(false);
        },
      );
    } catch (e) {
      // Get.snackbar('Error', e.toString());
      Get.offAllNamed('/login');
    }
  }
}
