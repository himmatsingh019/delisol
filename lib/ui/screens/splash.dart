import 'dart:async';
import 'package:delisol/controllers/auth_controller.dart';
import 'package:delisol/core/services/local_storage.dart';
import 'package:delisol/ui/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String route = '/splash';

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (LocalStorage.preferences.getString('token') != null) {
      ref.read(AuthController.provider.notifier).getUser();
      ref.read(DeliveryController.provider.notifier).getDeliveryDetails();
      return;
    }
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
        LoginScreen.route,
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/png/image.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/png/logo.png',
              fit: BoxFit.cover,
              scale: 1.6,
            ),
          ],
        ),
      ),
    );
  }
}
