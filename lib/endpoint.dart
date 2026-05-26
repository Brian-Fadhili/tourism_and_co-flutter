class Endpoint {
  static const String apiScheme = "http";
  static const String apiHost = "localhost";
  static const int apiPort = 80;
  static const String prefix = "/locations_api";

  static Uri uri(String path, {Map<String, dynamic>? queryParameters}) {
    return Uri(
      scheme: apiScheme,
      host: apiHost,
      port: apiPort,
      path: '$prefix$path',
      queryParameters: queryParameters,
    );
  }
}