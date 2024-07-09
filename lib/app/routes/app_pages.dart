import 'package:get/get.dart';
import 'package:propertio_getx/app/modules/agen/views/detail_agen_view.dart';

import '../modules/agen/bindings/agen_binding.dart';
import '../modules/agen/views/agen_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_project/bindings/detail_project_binding.dart';
import '../modules/detail_project/views/detail_project_view.dart';
import '../modules/detail_unit/bindings/detail_unit_binding.dart';
import '../modules/detail_unit/views/detail_unit_view.dart';
import '../modules/favorite/bindings/favorite_binding.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kpr/bindings/kpr_binding.dart';
import '../modules/kpr/views/kpr_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/project/bindings/project_binding.dart';
import '../modules/project/views/project_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      bindings: [
        DashboardBinding(),
        HomeBinding(),
        FavoriteBinding(),
        ProfileBinding(),
        KprBinding(),
        AgenBinding(),
        ProjectBinding(),
      ],
    ),
    GetPage(
      name: _Paths.PROJECT,
      page: () => ProjectView(),
      binding: ProjectBinding(),
    ),
    GetPage(
        name: _Paths.SPLASH,
        page: () => SplashView(),
        bindings: [SplashBinding(), LoginBinding()]),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PROJECT,
      page: () => DetailProjectView(),
      bindings: [DetailProjectBinding(), ProjectBinding()],
    ),
    GetPage(
      name: _Paths.KPR,
      page: () => KprView(),
      binding: KprBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_UNIT,
      page: () => const DetailUnitView(),
      binding: DetailUnitBinding(),
    ),
    GetPage(
      name: _Paths.AGEN,
      page: () => AgenView(),
      binding: AgenBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_AGEN,
      page: () => DetailAgenView(),
      binding: AgenBinding(),
    ),
  ];
}
