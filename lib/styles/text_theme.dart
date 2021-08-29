import 'package:adroit/styles/colors.dart';
import 'package:adroit/styles/text_style.dart';
import 'package:flutter/material.dart';

final TextTheme kLightTextTheme = TextTheme(
  headline2: kHeadLine2TextStyle.copyWith(
    color: kLightThemeTextColor,
  ), // For the splash screen logo text
  bodyText1: kBody1TextStyle.copyWith(
    color: kLightThemeTextColor,
  ),
);

/// TODO: Implement dark text theme
// final TextTheme kDarkTextTheme = TextTheme();
