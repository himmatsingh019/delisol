import 'package:delisol/ui/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (loading) return;

        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 22),
        height: 46,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: loading
              ? CupertinoActivityIndicator()
              : Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
