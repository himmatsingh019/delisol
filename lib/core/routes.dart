import 'package:delisol/ui/screens/home.dart';
import 'package:delisol/ui/screens/login.dart';
import 'package:delisol/ui/screens/register.dart';
import 'package:delisol/ui/screens/splash.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget widget = Container();
    switch (settings.name) {
      case HomeScreen.route:
        widget = HomeScreen();
        break;

      case RegisterScreen.route:
        widget = RegisterScreen();
        break;

      case SplashScreen.route:
        widget = SplashScreen();
        break;

      case LoginScreen.route:
        widget = LoginScreen();
        break;
    }

    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
