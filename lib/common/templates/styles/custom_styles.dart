import 'package:flutter/material.dart';

extension CustomStyles on TextTheme {
  TextStyle get appBarTextStyle {
    return const TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle get elevatedButtonTextStyle {
    return const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    );
  }
}

