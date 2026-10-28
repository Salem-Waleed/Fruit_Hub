import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/widget/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObcure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obcureText: isObcure,
      onSaved: widget.onSaved,
      hintTxet: "كلمة المرور",
      textInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          isObcure = !isObcure;
          setState(() {
            
          });
        },
        child: isObcure
            ? Icon(Icons.visibility_outlined, color: Color(0xffC9CECF))
            : Icon(Icons.visibility_off, color: Color(0xffC9CECF)),
      ),
    );
  }
}
