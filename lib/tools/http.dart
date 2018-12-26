import 'package:dio/dio.dart';

final options = Options(
  baseUrl: "https://api-v2.soundcloud.com",
  connectTimeout: 60000,
  receiveTimeout: 60000,
);

final dio = Dio(options);

class APIQueryBase {
  final clientId = 'SvO3OcT2oRvMpO7TMLthQIjS5ON9UfXY';
}
