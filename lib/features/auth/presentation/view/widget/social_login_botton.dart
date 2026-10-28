import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub_app/core/app_text_styles.dart';

class SocialLoginBotton extends StatelessWidget {
  const SocialLoginBotton({
    super.key,
    required this.socialIcon,
    required this.text,
    required this.ontap,
  });
  final String socialIcon;
  final String text;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xffDDDFDF),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 6.0),
                child: SvgPicture.asset(
                  socialIcon,
                  
                ),
              ),
              Spacer(flex: 1),
              Text(text,style: TextStyles.semiBold16,),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
