import 'package:get/get.dart';
import 'package:propertio_getx/app/data/datasource/profile_remote_datasource.dart';
import 'package:propertio_getx/app/data/model/responses/profil_response_model.dart';

class ProfileController extends GetxController {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  Rx<ProfilResponseModel> profileData = ProfilResponseModel().obs;
  var isLoading = false.obs;
  var errorMessage = RxString('');
  var isError = false.obs;

  ProfileController(this._profileRemoteDataSource);

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    isLoading(true);
    final result = await _profileRemoteDataSource.getProfile();
    isLoading(false);

    result.fold(
      (left) {
        errorMessage.value = left;
        isError(true);
      },
      (right) {
        errorMessage.value = '';
        profileData.value = right;
        isError(false);
      },
    );
  }
}
