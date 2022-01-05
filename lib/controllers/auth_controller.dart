import 'package:delisol/core/services/dio_client.dart';
import 'package:delisol/core/services/local_storage.dart';
import 'package:delisol/data/models/custom_response.dart';
import 'package:delisol/data/models/delivery_model.dart';
import 'package:delisol/data/models/login_response.dart';
import 'package:delisol/data/models/user_model.dart';
import 'package:delisol/data/repositories/auth_repository.dart';
import 'package:delisol/main.dart';
import 'package:delisol/ui/screens/home.dart';
import 'package:delisol/ui/screens/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<UserModel?> {
  static final provider = StateNotifierProvider<AuthController, UserModel?>((ref) => AuthController(ref.read));

  AuthController(this.read) : super(null);
  final Reader read;

  Future<void> getUser() async {
    read(AuthLoadingController.provider.notifier).toggleLoading(true);
    CustomResponse<UserModel> response = await read(AuthRepository.provider).getUser();
    read(AuthLoadingController.provider.notifier).toggleLoading(false);

    if (response.status == Status.ERROR) {
      print(response.message);
      return;
    }

    state = response.data;
    sendToken();
    navigationKey.currentState!.pushNamedAndRemoveUntil(
      HomeScreen.route,
      (route) => false,
    );
  }

  Future<void> sendNotification() async {
    CustomResponse<bool> response = await read(AuthRepository.provider).sendNotificaiton(
      userID: state!.id,
    );

    if (response.status == Status.ERROR) {
      print(response.message);
      state = null;
      return;
    }

    return;
  }

  Future<void> sendToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token == null) {
      return;
    }

    CustomResponse<bool> response = await read(AuthRepository.provider).sendNotificationToken(
      token,
      state!.id,
    );

    if (response.status == Status.ERROR) {
      print(response.message);
      state = null;
      return;
    }

    return;
  }

  Future<void> register({
    required String email,
    required String password,
    required String passwordCheck,
    required String firstName,
    required String lastName,
    required String username,
    required String phoneNumber,
  }) async {
    read(AuthLoadingController.provider.notifier).toggleLoading(true);
    CustomResponse<UserModel> response = await read(AuthRepository.provider).registerUser(
      email: email,
      password: password,
      passwordCheck: passwordCheck,
      firstName: firstName,
      lastName: lastName,
      username: username,
      phoneNumber: phoneNumber,
    );
    read(AuthLoadingController.provider.notifier).toggleLoading(false);
    if (response.status == Status.ERROR) {
      print(response.message);
      state = null;
      return;
    }
    navigationKey.currentState!.pushNamedAndRemoveUntil(
      LoginScreen.route,
      (route) => false,
    );
  }

  Future<void> login(String email, String password) async {
    read(AuthLoadingController.provider.notifier).toggleLoading(true);
    CustomResponse<LoginResponse> response = await read(AuthRepository.provider).login(
      email,
      password,
    );
    read(AuthLoadingController.provider.notifier).toggleLoading(false);
    if (response.status == Status.ERROR) {
      print(response.message);
      state = null;
      return;
    }

    LocalStorage.instance.setString('token', response.data.token);
    LocalStorage.init();
    DioClient.refreshToken();
    read(DeliveryController.provider.notifier).getDeliveryDetails();
    state = response.data.user;

    navigationKey.currentState!.pushNamedAndRemoveUntil(
      HomeScreen.route,
      (route) => false,
    );
  }

  void logoutUser() {
    LocalStorage.instance.deleteToken('token');
    navigationKey.currentState!.pushNamedAndRemoveUntil(
      LoginScreen.route,
      (route) => false,
    );
  }
}

class AuthLoadingController extends StateNotifier<bool> {
  static final provider = StateNotifierProvider<AuthLoadingController, bool>((ref) => AuthLoadingController());

  AuthLoadingController() : super(false);

  toggleLoading(bool isLoading) {
    state = isLoading;
  }
}

class DeliveryController extends StateNotifier<List<DeliveryModel>> {
  static final provider = StateNotifierProvider<DeliveryController, List<DeliveryModel>>((ref) => DeliveryController(ref.read));

  DeliveryController(this.read) : super([]);
  final Reader read;

  Future<void> getDeliveryDetails() async {
    CustomResponse<List<DeliveryModel>> deliveryResponse = await read(AuthRepository.provider).getDeliveryDetails();

    if (deliveryResponse.status == Status.ERROR) {
      print(deliveryResponse.message);
      return;
    }

    state = deliveryResponse.data;
  }
}
