import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: const Color(0xFFDDDFDF))),
        SizedBox(width: 18),
        Text(
          'أو',
          style: TextStyles.semiBold16.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
        SizedBox(width: 18),
        Expanded(child: Divider(color: const Color(0xFFDDDFDF))),
      ],
    );
  }
}
