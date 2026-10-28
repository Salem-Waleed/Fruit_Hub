import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/signIn_view.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/signup_view.dart';
import 'package:fruit_hub_app/features/onbording/persintation/view/onbording_view.dart';
import 'package:fruit_hub_app/features/splash/persntation/view/splash_view.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
