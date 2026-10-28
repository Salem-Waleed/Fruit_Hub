import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/constant.dart';
import 'package:fruit_hub_app/core/helper_function/build_error_bar.dart';
import 'package:fruit_hub_app/core/widget/custom_botton.dart';
import 'package:fruit_hub_app/core/widget/custom_text_form_field.dart';
import 'package:fruit_hub_app/core/widget/password_field.dart';
import 'package:fruit_hub_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/widget/have_an_account.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/widget/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password;
  late bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintTxet: "الاسم كامل",
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintTxet: "البريد الإلكتروني",
                textInputType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),

              const SizedBox(height: 16),
               TermsAndConditions(
                onchange: (value) {
                  isTermsAccepted = value;
                },
               ),
              const SizedBox(height: 30),
              CustomBotton(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context.read<SignupCubit>().createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                        name: userName,
                      );
                      
                    }else{
                      buildError(context, 'الرجاء الموافقة على سياسة الشروط والاحكتم');
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

