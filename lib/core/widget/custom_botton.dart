import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/app_text_styles.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),backgroundColor: AppColors.primaryColor),
        child: Text(text,style: TextStyles.bold16.copyWith(color: Colors.white),),
      ),
    );
  }
}
