import 'package:delisol/data/models/user_model.dart';

class LoginResponse {
  final String token;
  final UserModel user;

  LoginResponse({required this.token, required this.user});

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        token: json['token'],
        user: UserModel.fromMap(json['user']),
      );

  Map<String, dynamic> toMap() => {
        'token': token,
        'user': user.toMap(),
      };
}
