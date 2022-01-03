import 'package:delisol/core/routes.dart';
import 'package:delisol/ui/screens/home.dart';
import 'package:delisol/ui/screens/login.dart';
import 'package:delisol/ui/screens/register.dart';
import 'package:delisol/ui/screens/splash.dart';
import 'package:delisol/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: HomeScreen.route,
      theme: AppTheme.theme,
    );
  }
}
