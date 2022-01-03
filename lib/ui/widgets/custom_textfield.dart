import 'package:delisol/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  final bool isPassword;
  final String hintText;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? !visiblePassword : false,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(
                    () {
                      visiblePassword = !visiblePassword;
                    },
                  );
                },
                child: Icon(
                  visiblePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        fillColor: AppColors.lightGrey,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        label: Text(widget.hintText),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
