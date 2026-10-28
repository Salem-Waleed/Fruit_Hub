import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/widget/custom_appbar.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'تسجيل دخول'),
      body: const LoginViewBody(),
    );
  }
}
