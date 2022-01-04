import 'package:delisol/core/services/local_storage.dart';
import 'package:dio/dio.dart';

class DioClient {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://pacific-fjord-71880.herokuapp.com',
      headers: {
        "x-auth-token": LocalStorage.preferences.getString('token'),
      },
    ),
  );

  static void refreshToken() {
    String token = LocalStorage.preferences.getString('token') ?? '';
    dio.options.headers = {
      "x-auth-token": token,
    };
  }
}
