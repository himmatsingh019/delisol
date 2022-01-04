import 'package:delisol/controllers/auth_controller.dart';
import 'package:delisol/ui/theme/app_colors.dart';
import 'package:delisol/ui/widgets/custom_button.dart';
import 'package:delisol/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String route = '/register';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                            controller: firstNameController,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: CustomTextField(
                            hintText: 'Last Name',
                            controller: lastNameController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Email Address',
                      controller: emailController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Username',
                      controller: usernameController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Password',
                      isPassword: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      isPassword: true,
                      hintText: 'Re-enter Password',
                      controller: passwordCheckController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Phone Number',
                      controller: phoneNumberController,
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
                    Consumer(
                      builder: (context, ref, _) {
                        final loading = ref.watch(AuthLoadingController.provider);

                        return CustomButton(
                          loading: loading,
                          onTap: () {
                            ref.read(AuthController.provider.notifier).register(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  passwordCheck: passwordCheckController.text,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  username: usernameController.text,
                                  phoneNumber: phoneNumberController.text,
                                );
                          },
                        );
                      },
                    ),
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
