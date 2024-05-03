import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/homepage_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/homepage_response_Model.dart';

class HomeController extends GetxController {
  final HomePageRemoteDataSource _remoteDataSource;
  var isLoading = false.obs;
  var homePageData = Rxn<HomePageModel>(); // Rxn allows nullability
  var errorMessage = RxString('');

  HomeController(this._remoteDataSource);

  @override
  void onInit() {
    super.onInit();
    fetchHomePageData();
  }

  Future<void> fetchHomePageData() async {
    isLoading(true);
    final result = await _remoteDataSource.getHomePage();
    isLoading(false);

    result.fold(
      (left) => errorMessage.value = left, // error handling
      (right) => homePageData.value = right, // success handling
    );
  }
}
