import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/onbording/persintation/widget/onbording_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const routeName = 'onboarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: const OnbordingViewBody()));
  }
}
