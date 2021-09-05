import 'package:adroit/styles/colors.dart';
import 'package:adroit/styles/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final baseTheme = ThemeData.light();

  return baseTheme.copyWith(
    scaffoldBackgroundColor: kScaffoldColor,
    primaryColor: kPrimaryColorLight,
    accentColor: kSecondaryColorLight,
    textTheme: kLightTextTheme,
  );
}
