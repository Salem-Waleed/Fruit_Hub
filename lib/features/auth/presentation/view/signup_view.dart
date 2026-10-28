import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/services/get_it_service.dart';
import 'package:fruit_hub_app/core/widget/custom_appbar.dart';
import 'package:fruit_hub_app/features/auth/domain/repo/auth_repo.dart';
import 'package:fruit_hub_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/widget/sinup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: appBar(context, title: 'حساب جديد'),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}

