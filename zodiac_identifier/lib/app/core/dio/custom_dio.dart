import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class CustomDio extends DioForNative {

  CustomDio() : super (
    BaseOptions(
      baseUrl: 'https://constellation-api.onrender.com',
      connectTimeout: const Duration(seconds: 5000),
      receiveTimeout: const Duration(seconds: 60000),
    ),
  ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}