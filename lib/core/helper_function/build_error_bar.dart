 import 'package:flutter/material.dart';

void buildError(BuildContext context, String massage) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massage),
        backgroundColor: Colors.red,
      ),
    );
  }