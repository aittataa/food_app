import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color clearColor = Color(0xff08ff00);
  static const Color errorColor = Color(0xfffd0000);

  static const Color mainColor = Color(0xFFFEC915);
  static const Color backgroundColor = Color(0xFFF0F0F0);
  static const Color backgroundImageColor = Color(0xFFFFFFFF); //F8F8F8
  static const Color primaryBackColor = Color(0xFFFFFFFF);
  static const Color secondaryBackColor = Color(0xFFBDBDBD); //BDBDBD
  static const Color transparentColor = Color(0x00000000);
  static const Color shadowColor = Color(0x1F000000);
  static const Color borderColor = Color(0x8A000000);

  /// TODO : Icons
  static const Color mainIconColor = Color(0xFFF44336);
  static const Color primaryIconColor = Color(0xFF000000);
  static const Color secondaryIconColor = Color(0xFFFFFFFF);

  /// TODO : Field Text Colors
  static const Color fieldTextBackground = Color(0xFFE5E5E5);

  /// TODO : Texts
  static const Color primaryTextColor = Color(0xFF000000);
  static const Color secondaryTextColor = Color(0xFFFFFFFF);

  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: AppTheme.backgroundColor,
      primaryColor: AppTheme.backgroundColor,
      splashColor: AppTheme.backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.backgroundColor,
        titleTextStyle: TextStyle(
          color: AppTheme.primaryTextColor.withOpacity(.65),
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: AppTheme.primaryIconColor,
          opacity: .75,
        ),
      ),
    );
  }
}
