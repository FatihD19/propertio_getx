import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propertio_getx/app/data/datasource/project_remote_datasource.dart';
import 'package:propertio_getx/app/modules/detail_project/controllers/detail_project_controller.dart';
import 'package:propertio_getx/app/modules/project/controllers/project_controller.dart';
import 'package:get/get.dart';
import '../../../../helpers/dummy_data/propertio_data.dart';

class MockProjectRemoteDataSource extends Mock
    implements ProjectRemoteDataSource {}

void main() {
  late ProjectController controller;
  late DetailProjectController detailProjectController;
  late MockProjectRemoteDataSource mockProjectRemoteDataSource;

  setUp(() {
    mockProjectRemoteDataSource = MockProjectRemoteDataSource();

    controller = ProjectController(mockProjectRemoteDataSource);
    detailProjectController =
        DetailProjectController(mockProjectRemoteDataSource);
  });

  group('ProjectController', () {
    test('fetchListProjectData sets listProjectData on success', () async {
      final listProjectModel = tListDataProject;
      when(() => mockProjectRemoteDataSource.getProject())
          .thenAnswer((_) async => Right(tListDataProject));

      await controller.fetchProjectData();

      expect(controller.isLoading.value, false);
      expect(controller.projectData.value, listProjectModel);
      expect(controller.errorMessage.value, '');
    });

    test('fetchListProjectData sets errorMessage on failure', () async {
      const errorMessage = 'Failed to fetch data';
      when(() => mockProjectRemoteDataSource.getProject())
          .thenAnswer((_) async => Left(errorMessage));

      await controller.fetchProjectData();

      expect(controller.isLoading.value, false);
      expect(controller.projectData.value, null);
      expect(controller.errorMessage.value, errorMessage);
    });
  });

  group('DetailProjectController', () {
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
  });
}
