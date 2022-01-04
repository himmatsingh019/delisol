import 'package:delisol/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReadOnlyTextField extends StatelessWidget {
  const ReadOnlyTextField({
    Key? key,
    required this.hint,
    this.isMap = false,
    this.isName = false,
    required this.value,
    this.callback,
  }) : super(key: key);

  final String hint;
  final bool isMap;
  final bool isName;
  final String value;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: isName
            ? null
            : GestureDetector(
                onTap: callback,
                child: Icon(
                  isMap ? Icons.map : Icons.phone,
                  color: Colors.grey,
                ),
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
