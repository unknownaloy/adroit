import 'package:adroit/utils/text_style.dart';
import 'package:adroit/utils/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final baseTheme = ThemeData.light();

  return baseTheme.copyWith(
    primaryColor: Color(0xffDEEEEA),
    accentColor: Color(0xffBF1363),
    textTheme: kTextTheme,
  );
}
