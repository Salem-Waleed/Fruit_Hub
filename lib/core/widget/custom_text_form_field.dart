import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintTxet,
    required this.textInputType,
    this.suffixIcon, 
    this.onSaved, 
     this.obcureText,
  });
  final String hintTxet;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool? obcureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obcureText ?? false,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: textInputType,

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintTxet,
        hintStyle: TextStyles.bold13.copyWith(color: const Color(0xff949D9E)),
        filled: true,
        fillColor: Color(0xffF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, color: Color(0xffE9E9E9)),
    );
  }
}
