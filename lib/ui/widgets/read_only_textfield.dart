import 'package:delisol/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ReadOnlyTextField extends StatelessWidget {
  const ReadOnlyTextField({
    Key? key,
    required this.hint,
    this.isMap = false,
    this.isNumber = false,
    required this.value,
  }) : super(key: key);

  final String hint;
  final bool isMap;
  final bool isNumber;
  final String value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      enabled: false,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            print('Map Clicked');
          },
          child: Icon(Icons.map),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        fillColor: AppColors.lightGrey,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        label: Text(hint),
        labelStyle: TextStyle(
          color: AppColors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
