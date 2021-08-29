import 'package:adroit/styles/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final baseTheme = ThemeData.light();

  return baseTheme.copyWith(
    scaffoldBackgroundColor: Color(0xffE8F6EF),
    primaryColor: Color(0xffE8F6EF),
    accentColor: Color(0xffFFE194),
    textTheme: kLightTextTheme,
  );
}
