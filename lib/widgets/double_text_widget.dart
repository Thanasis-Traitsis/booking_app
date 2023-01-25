import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class AppDoubleTextWidget extends StatelessWidget {
  final String bigText;
  const AppDoubleTextWidget({super.key, required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigText,
          style: Styles.headLineStyle2,
        ),
        Text(
          'View all',
          style: Styles.textStyle.copyWith(
            color: Styles.primaryColor,
          ),
        ),
      ],
    );
  }
}
