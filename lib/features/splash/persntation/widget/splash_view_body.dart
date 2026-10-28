import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub_app/constant.dart';
import 'package:fruit_hub_app/core/services/shared_preferences.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/signIn_view.dart';
import 'package:fruit_hub_app/features/onbording/persintation/view/onbording_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom),
      ],
    );
  }

  void excuteNavigation() {

    bool isOnBoradingViewSeen = Prefs.getBool(kIsOnBoradingViewSeen) ??  false;
   Future.delayed(const Duration(seconds: 3),(){
    isOnBoradingViewSeen
        ? Navigator.pushReplacementNamed(context, LoginView.routeName)
        : Navigator.pushReplacementNamed(context, OnboardingView.routeName);
   }); 
  }
}
