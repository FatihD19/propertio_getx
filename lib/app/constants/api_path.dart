class ApiPath {
  static const String url = 'https://beta.propertio.id';
  static const String baseUrl = '$url/api';
  static String image(String fileName) => '$url/$fileName';
  static String imageMonitoring(String fileName) =>
      '$url/storage/monitoring/$fileName';
}

class ShareUrl {
  static String project(String slug) =>
      '${ApiPath.url}/home/project/detail?slug=$slug';
  static String properti(String slug) =>
      '${ApiPath.url}/home/properti/detail?slug=$slug';
  static String unit(String code) =>
      '${ApiPath.url}/home/unit/detail?code=$code';
}
