import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFFF5E7D2);
  static const primaryBrown = Color(0xFF6F4E37);
  static const secondaryBrown = Color(0xFFA97458);
  static const white = Colors.white;
  static const white70 = Colors.white70;
}

class AppTextStyles {
  static const header = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    fontFamily: 'Georgia',
  );

  static const slogan = TextStyle(fontSize: 14, color: AppColors.white70);

  static const sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const normalText = TextStyle(fontSize: 14, color: Colors.black87);
}

class AppSizes {
  static const padding = EdgeInsets.symmetric(horizontal: 16, vertical: 6);
  static const cardPadding = EdgeInsets.all(12);
  static const iconSize = 16.0;
  static const socialIconSize = 32.0;
}
