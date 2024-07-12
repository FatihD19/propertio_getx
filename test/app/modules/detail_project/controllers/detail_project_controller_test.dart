import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propertio_getx/app/modules/detail_project/controllers/detail_project_controller.dart';

import '../../../../helpers/dummy_data/propertio_data.dart';
import '../../project/controllers/project_controller_test.dart';

Future<void> main() async {
  late MockProjectRemoteDataSource mockProjectRemoteDataSource;
  late DetailProjectController detailProjectController;

  setUp(() {
    mockProjectRemoteDataSource = MockProjectRemoteDataSource();
    // Get.reset(); // Reset GetX state before each test
    // Get.put(
    //     mockProjectRemoteDataSource); // Register the mock remote data source

    // detailProjectController.slug = 'gedung-pusat-perbelanjaan';
    // Get.to(detailProjectController, arguments: 'gedung-pusat-perbelanjaan');
    detailProjectController =
        DetailProjectController(mockProjectRemoteDataSource);
  });

  test('initial state is correct', () {
    Get.parameters = {'slug': 'test-slug'};

    expect(detailProjectController.detailData.value, isNull);
    expect(detailProjectController.isLoading.value, isFalse);
    expect(detailProjectController.errorMessage.value, isEmpty);
    expect(detailProjectController.isError.value, isFalse);
  });

  test('fetchDetailProjectData sets detailData on success', () async {
    when(() => mockProjectRemoteDataSource
            .getDetailProject('gedung-pusat-perbelanjaan'))
        .thenAnswer((_) async => Right(tDetailProject));

    await detailProjectController
        .fetchDetailProjectData('gedung-pusat-perbelanjaan');

    expect(detailProjectController.isLoading.value, isFalse);
    expect(detailProjectController.errorMessage.value, isEmpty);
    expect(detailProjectController.isError.value, isFalse);
    expect(detailProjectController.detailData.value, tDetailProject);
  });
  // test('fetchDetailProjectData sets errorMessage on failure', () async {
  //   when(() => mockProjectRemoteDataSource
  //           .getDetailProject('gedung-pusat-perbelanjaan'))
  //       .thenAnswer((_) async => Right(tDetailProject));

  //   Get.parameters = {'slug': 'test-slug'};

  //   await detailProjectController.fetchDetailProjectData();

  //   expect(detailProjectController.isLoading.value, isFalse);
  //   expect(detailProjectController.errorMessage.value, isEmpty);
  //   expect(detailProjectController.isError.value, isTrue);
  //   expect(detailProjectController.detailData.value, isNull);
  // });
}
