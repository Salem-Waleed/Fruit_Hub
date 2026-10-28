import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/helper_function/build_error_bar.dart';
import 'package:fruit_hub_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/widget/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
       if (state is SignupFailure) {
          buildError(context, state.errorMessage);
        } else if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إنشاء الحساب بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading? true : false,
          child: SignupViewBody(),
        );
      },
    );
  }

 
}
