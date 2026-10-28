import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/app_text_styles.dart';

AppBar appBar(BuildContext context, {required String title}) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
      title: Text(
        title,
        // textAlign: TextAlign.center,
        style: TextStyles.bold19,
      ),
    );
  }