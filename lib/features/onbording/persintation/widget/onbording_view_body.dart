import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_app/constant.dart';
import 'package:fruit_hub_app/core/services/shared_preferences.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/widget/custom_botton.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/signIn_view.dart';
import 'package:fruit_hub_app/features/onbording/persintation/widget/onboarding_page_view.dart';

class OnbordingViewBody extends StatefulWidget {
  const OnbordingViewBody({super.key});

  @override
  State<OnbordingViewBody> createState() => _OnbordingViewBodyState();
}

class _OnbordingViewBodyState extends State<OnbordingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnboardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: 0.50),
          ),
        ),
        SizedBox(height: 29),

        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomBotton(
              onPressed: () {
                Prefs.setBool(kIsOnBoradingViewSeen, true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
              text: 'ابدأ الان',
            ),
          ),
        ),

        SizedBox(height: 43),
      ],
    );
  }
}
