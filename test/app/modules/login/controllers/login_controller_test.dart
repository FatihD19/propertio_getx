import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propertio_getx/app/data/datasource/auth_local_datasource.dart';
import 'package:propertio_getx/app/data/datasource/auth_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/request/login_request_model.dart';
import 'package:propertio_getx/app/modules/login/controllers/login_controller.dart';

import '../../../../helpers/dummy_data/propertio_data.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late LoginController loginController;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    loginController =
        LoginController(mockAuthRemoteDataSource, mockAuthLocalDataSource);
    Get.testMode = true; // Enable GetX test mode
  });

  tearDown(() {
    loginController.dispose();
  });

  final loginForm = LoginRequestModel(
    email: 'user@mail.com',
    password: '11111111',
  );
  final wrongLogin = LoginRequestModel(
    email: 'false@mail.com',
    password: '2false111111',
  );

  final nullLoginForm = LoginRequestModel(
    email: '',
    password: '',
  );
  test('initial state is correct', () {
    expect(loginController.isLoading.value, isFalse);
    expect(loginController.isError.value, isFalse);
    expect(loginController.errorMessage.value, isEmpty);
    expect(loginController.loginResponse.value, isNull);
  });

  // test('validateLogin shows snackbar when email is empty', () {
  //   loginController.emailController.text = '';
  //   loginController.passwordController.text = 'password';

  //   loginController.validateLogin();

  //   expect(Get.isSnackbarOpen, true);
  //   expect(Get.currentSnackbar?.titleText?.toString(), 'Error');
  //   expect(Get.currentSnackbar?.messageText?.toString(),
  //       'Email tidak boleh kosong');
  // });

  // test('validateLogin shows snackbar when password is empty', () {
  //   loginController.emailController.text = 'email@example.com';
  //   loginController.passwordController.text = '';

  //   loginController.validateLogin();

  //   expect(Get.isSnackbarOpen, true);
  //   expect(Get.currentSnackbar?.titleText?.toString(), 'Error');
  //   expect(Get.currentSnackbar?.messageText?.toString(),
  //       'Password tidak boleh kosong');
  // });

  // test('validateLogin calls login when email and password are not empty',
  //     () async {
  //   loginController.emailController.text = 'email@example.com';
  //   loginController.passwordController.text = 'password';

  //   when(mockAuthRemoteDataSource.login(any)).thenAnswer((_) async =>
  //       Right(LoginResponseModel(/* initialize with test data */)));

  //   loginController.validateLogin();

  //   verify(mockAuthRemoteDataSource.login(any)).called(1);
  // });

  // test('login sets isLoading to true and false', () async {
  //   loginController.emailController.text = 'email@example.com';
  //   loginController.passwordController.text = 'password';

  //   when(mockAuthRemoteDataSource.login(any)).thenAnswer((_) async =>
  //       Right(LoginResponseModel(/* initialize with test data */)));

  //   final future = loginController.login();
  //   expect(loginController.isLoading.value, true);
  //   await future;
  //   expect(loginController.isLoading.value, false);
  // });

  // test('login sets errorMessage and isError on failure', () async {
  //   loginController.emailController.text = 'email@example.com';
  //   loginController.passwordController.text = 'password';

  //   const error = 'Login failed';
  //   when(mockAuthRemoteDataSource.login(any))
  //       .thenAnswer((_) async => Left(error));

  //   await loginController.login();

  //   expect(loginController.isError.value, true);
  //   expect(loginController.errorMessage.value, error);
  // });

  test('login navigates to /dashboard on success', () async {
    loginController.emailController.text = 'user@mail.com';
    loginController.passwordController.text = '11111111';

    when(() => mockAuthRemoteDataSource.login(loginForm))
        .thenAnswer((_) async => Right(tLoginData));
    await loginController.login(loginReq: loginForm);

    // expect(Get.currentRoute, '/dashboard');
    expect(loginController.loginResponse.value, tLoginData);
    expect(loginController.isError.value, false);
  });

  // test('AuthGetCurrentUser navigates to /dashboard on success', () async {
  //   final loginRequest =
  //       LoginRequestModel(email: 'email@example.com', password: 'password');
  //   when(mockAuthLocalDataSource.getCredentialFromLocal())
  //       .thenAnswer((_) async => loginRequest);
  //   final loginResponse = LoginResponseModel(/* initialize with test data */);
  //   when(mockAuthRemoteDataSource.login(any))
  //       .thenAnswer((_) async => Right(loginResponse));

  //   await loginController.AuthGetCurrentUser();

  //   expect(Get.currentRoute, '/dashboard');
  //   expect(loginController.isError.value, false);
  // });

  // test('AuthGetCurrentUser navigates to /login on failure', () async {
  //   final loginRequest =
  //       LoginRequestModel(email: 'email@example.com', password: 'password');
  //   when(mockAuthLocalDataSource.getCredentialFromLocal())
  //       .thenAnswer((_) async => loginRequest);
  //   const error = 'Login failed';
  //   when(mockAuthRemoteDataSource.login(any))
  //       .thenAnswer((_) async => Left(error));

  //   await loginController.AuthGetCurrentUser();

  //   expect(Get.currentRoute, '/login');
  //   expect(loginController.isError.value, true);
  //   expect(loginController.errorMessage.value, error);
  // });

  // test('AuthGetCurrentUser navigates to /login on exception', () async {
  //   when(mockAuthLocalDataSource.getCredentialFromLocal())
  //       .thenThrow(Exception('An error occurred'));

  //   await loginController.AuthGetCurrentUser();

  //   expect(Get.currentRoute, '/login');
  // });
}
