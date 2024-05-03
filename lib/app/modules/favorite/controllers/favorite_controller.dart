import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/favortite_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/project_favorite_response_model.dart';
import 'package:propertio_getx/app/shared/ui/components/dialog_view.dart';

class FavoriteController extends GetxController {
  final FavoriteRemoteDataSource _favoriteRemoteDataSource;
  var isLoading = false.obs;
  var favoriteData = Rxn<ProjectFavoriteResponseModel>();
  var errorMessage = RxString('');
  var isError = false.obs;
  FavoriteController(this._favoriteRemoteDataSource);

  @override
  void onInit() {
    super.onInit();
    fetchFavoriteData();
  }

  Future<void> fetchFavoriteData({int? page}) async {
    isLoading(true);
    final result =
        await _favoriteRemoteDataSource.getFavoriteProject(page: page);
    isLoading(false);

    result.fold(
      (left) {
        errorMessage.value = left;
        isError(true);
      },
      (right) {
        errorMessage.value = '';
        favoriteData.value = right;
        isError(false);
      },
    );
  }

  Future<void> addFavoriteProject(String projectCode) async {
    isLoading(true);
    final result =
        await _favoriteRemoteDataSource.postFavorite(projectCode: projectCode);
    isLoading(false);
    if (result == true) {
      Get.snackbar('Success', 'Berhasil menambahkan project ke favorite');
      fetchFavoriteData();
    } else {
      isError(true);
      Get.snackbar('Error', 'Gagal menambahkan project ke favorite');
    }
  }

  Future<void> deleteFavoriteProject(String projectCode) async {
    isLoading(true);
    final result = await _favoriteRemoteDataSource.deleteFavorite(
        projectCode: projectCode);
    isLoading(false);
    if (result == true) {
      Get.snackbar('Success', 'Berhasil menghapus project dari favorite');
      fetchFavoriteData();
    } else {
      isError(true);
      Get.snackbar('Error', 'Gagal menghapus project dari favorite');
    }
  }
}
