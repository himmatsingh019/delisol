import 'package:delisol/core/routes/routes.dart';
import 'package:delisol/core/services/local_storage.dart';
import 'package:delisol/ui/screens/splash.dart';
import 'package:delisol/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationKey = GlobalKey<NavigatorState>();

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigationKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: SplashScreen.route,
      theme: AppTheme.theme,
    );
  }
}
