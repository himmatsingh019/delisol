import 'package:delisol/ui/theme/app_colors.dart';
import 'package:delisol/ui/widgets/custom_button.dart';
import 'package:delisol/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String route = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
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
                      'Let\'s Sign you up.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Get Started.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomTextField(
                            hintText: 'First Name',
                            controller: TextEditingController(),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: CustomTextField(
                            hintText: 'Last Name',
                            controller: TextEditingController(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Email Address',
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Username',
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Password',
                      isPassword: true,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      isPassword: true,
                      hintText: 'Re-enter Password',
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Phone Number',
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.route);
                          },
                          child: Text(
                            ' Sign in',
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
            )
          ],
        ),
      ),
    );
  }
}
