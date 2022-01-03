import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String route = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Register'),
      ),
    );
  }
}
