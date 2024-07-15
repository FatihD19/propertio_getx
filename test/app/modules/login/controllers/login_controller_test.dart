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

class MockSnackbarController extends Mock implements SnackbarController {}

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
    // Mock Get.snackbar
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

  String error = 'Login failed';

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

  test('login navigates to /dashboard on success', () async {
    when(() => mockAuthRemoteDataSource.login(loginForm))
        .thenAnswer((_) async => Right(tLoginData));
    await loginController.login(loginReq: loginForm);

    expect(loginController.loginResponse.value, tLoginData);
    expect(loginController.isError.value, false);
  });

  test('login sets errorMessage and isError on failure', () async {
    when(() => mockAuthRemoteDataSource.login(wrongLogin))
        .thenAnswer((_) async => Left(error));

    await loginController.login(loginReq: wrongLogin);

    expect(loginController.isError.value, true);
    expect(loginController.errorMessage.value, error);
  });
  test('when AuthGetCurrentUser is successful', () async {
    when(() => mockAuthLocalDataSource.getCredentialFromLocal())
        .thenAnswer((_) async => loginForm);
    when(() => mockAuthRemoteDataSource.login(loginForm))
        .thenAnswer((_) async => Right(tLoginData));
    await loginController.AuthGetCurrentUser();

    expect(loginController.loginResponse.value, tLoginData);
    expect(loginController.isError.value, false);
  });

  test('when AuthGetCurrentUser is unsuccessful', () async {
    when(() => mockAuthLocalDataSource.getCredentialFromLocal())
        .thenThrow(Exception());
    await loginController.AuthGetCurrentUser();

    expect(loginController.isError.value, true);
  });
}
