import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/app_text_styles.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/widget/custom_botton.dart';
import 'package:fruit_hub_app/core/widget/custom_text_form_field.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/widget/dont_have_an_account_widget.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/widget/or_divider.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/widget/social_login_botton.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              hintTxet: "البريد الالكتروني",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintTxet: "كلمة المرور",
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.visibility_outlined,
                color: Color(0xffC9CECF),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'نسيت كلمة المرور؟',
                style: TextStyles.bold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 33),
            CustomBotton(text: 'تسجيل الدخول', onPressed: () {}),
            const SizedBox(height: 33),
            DontHaveAnAccountWidget(),
            const SizedBox(height: 33),
            const OrDivider(),
            const SizedBox(height: 16),
            SocialLoginBotton(
              socialIcon: Assets.imagesGoogleIcon,
              text: 'تسجيل بواسطة جوجل',
              ontap: () {},
            ),
            const SizedBox(height: 16),
            SocialLoginBotton(
              socialIcon: Assets.imagesApplIcon,
              text: 'تسجيل بواسطة أبل',
              ontap: () {},
            ),
            const SizedBox(height: 16),
            SocialLoginBotton(
              socialIcon: Assets.imagesFacebookIcon,
              text: 'تسجيل بواسطة فيسبوك',
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
