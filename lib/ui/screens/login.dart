import 'package:delisol/ui/screens/register.dart';
import 'package:delisol/ui/theme/app_colors.dart';
import 'package:delisol/ui/widgets/custom_button.dart';
import 'package:delisol/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String route = '/login';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/png/vector.png',
                          scale: 2.2,
                        ),
                      ],
                    ),
                    Text(
                      'Let\'s Sign you in.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Welcome back.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'You have been missed!',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      isPassword: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Recover Password',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?'),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.route);
                          },
                          child: Text(
                            ' Sign up',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    CustomButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
