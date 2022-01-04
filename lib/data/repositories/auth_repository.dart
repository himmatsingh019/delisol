import 'package:delisol/core/services/dio_client.dart';
import 'package:delisol/data/models/custom_response.dart';
import 'package:delisol/data/models/login_response.dart';
import 'package:delisol/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  static final provider = Provider<AuthRepository>((ref) => AuthRepository());

  Future<CustomResponse<UserModel>> getUser() async {
    try {
      Response response = await DioClient.dio.get(
        '/users',
      );
      return CustomResponse.completed(UserModel.fromMap(response.data));
    } on DioError catch (e) {
      return CustomResponse.error('API Error');
    } catch (e) {
      return CustomResponse.error('Something went wrong.');
    }
  }

  Future<CustomResponse<UserModel>> registerUser({
    required String email,
    required String password,
    required String passwordCheck,
    required String firstName,
    required String lastName,
    required String username,
    required String phoneNumber,
  }) async {
    try {
      Response response = await DioClient.dio.post(
        '/users/register',
        data: {
          "email": email,
          "password": password,
          "passwordCheck": passwordCheck,
          "first_name": firstName,
          "last_name": lastName,
          "username": username,
          "phone_number": phoneNumber,
        },
      );
      return CustomResponse.completed(UserModel.fromMap(response.data));
    } on DioError catch (err) {
      print(err.response!.data);
      return CustomResponse.error('API Error');
    } catch (e) {
      return CustomResponse.error('Something went wrong.');
    }
  }

  Future<CustomResponse<LoginResponse>> login(String email, String password) async {
    try {
      Response response = await DioClient.dio.post(
        '/users/login',
        data: {
          "email": email,
          "password": password,
        },
      );
      return CustomResponse.completed(LoginResponse.fromMap(response.data));
    } on DioError catch (err) {
      return CustomResponse.error('API Error');
    } catch (e) {
      return CustomResponse.error('Something went wrong.');
    }
  }
}
