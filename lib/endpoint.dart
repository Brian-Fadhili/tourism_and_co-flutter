class Endpoint {
  static const apiScheme = "http";
  static const apiHost = "localhost";
  static const apiPort = "80";
  static const prefix = "/locations_api";

  static Uri uri(String path, {Map<String, dynamic>? queryParameters}) {
    return Uri(
      scheme: apiScheme,
      host: apiHost,
      port: int.parse(apiPort),
      path: '$prefix$path',
      queryParameters: queryParameters,
    );
  }
}