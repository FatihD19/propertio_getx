import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propertio_getx/app/data/datasource/homepage_remote_datasource.dart';
import 'package:propertio_getx/app/modules/home/controllers/home_controller.dart';

import '../../../../helpers/dummy_data/propertio_data.dart';

// Mock class
class MockHomePageRemoteDataSource extends Mock
    implements HomePageRemoteDataSource {}

void main() {
  late HomeController controller;
  late MockHomePageRemoteDataSource mockGetHomePageRemoteDataSource;

  setUp(() {
    mockGetHomePageRemoteDataSource = MockHomePageRemoteDataSource();
    controller = HomeController(mockGetHomePageRemoteDataSource);
  });

  group('HomeController', () {
    test('initial values are correct', () {
      expect(controller.isLoading.value, false);
      expect(controller.homePageData.value, null);
      expect(controller.errorMessage.value, '');
    });

    test('fetchHomePageData sets homePageData on success', () async {
      final homePageModel = tDataHomePage;
      when(() => mockGetHomePageRemoteDataSource.getHomePage())
          .thenAnswer((_) async => Right(tDataHomePage));

      await controller.fetchHomePageData();

      expect(controller.isLoading.value, false);
      expect(controller.homePageData.value, homePageModel);
      expect(controller.errorMessage.value, '');
    });

    test('fetchHomePageData sets errorMessage on failure', () async {
      const errorMessage = 'Failed to fetch data';
      when(() => mockGetHomePageRemoteDataSource.getHomePage())
          .thenAnswer((_) async => Left(errorMessage));

      await controller.fetchHomePageData();

      expect(controller.isLoading.value, false);
      expect(controller.homePageData.value, null);
      expect(controller.errorMessage.value, errorMessage);
    });

    // test('isLoading is true during fetch', () async {
    //   final completer = Completer<Either<String, HomePageModel>>();
    //   when(mockGetHomePageRemoteDataSource.getHomePage()).thenAnswer((_) => completer.future);

    //   controller.fetchHomePageData();
    //   expect(controller.isLoading.value, true);

    //   completer.complete(
    //       Right(HomePageModel(/* initialize with necessary parameters */)));
    //   await untilCalled(mockGetHomePageRemoteDataSource.getHomePage());

    //   expect(controller.isLoading.value, false);
    // });
  });
}
