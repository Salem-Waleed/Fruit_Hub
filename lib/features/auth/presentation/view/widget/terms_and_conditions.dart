import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/app_text_styles.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/widget/custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onchange});
  final ValueChanged<bool> onchange;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       CustomCheckBox(
          isChecked: isTermsAccepted,
          valueChanged: (value) {
            setState(() {
              widget.onchange(value);
              isTermsAccepted = value;

            });
          },
        ),
       const SizedBox(width: 16), 
        Expanded(
          child: Text.rich(
            textAlign: TextAlign.start,
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold16.copyWith(
                    color: const Color(0xFF616A6B),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
