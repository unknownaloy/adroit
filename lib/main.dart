import 'package:adroit/ui/views/splash_screen.dart';
import 'package:adroit/utils/light_theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adroit',
      theme: lightTheme(),
      home: SplashScreen(),
    );
  }
}
