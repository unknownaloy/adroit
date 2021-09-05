import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:adroit/l10n/l10n.dart';
import 'package:adroit/ui/views/splash_screen.dart';
import 'package:adroit/styles/light_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Adroit',
      theme: lightTheme(),
      home: SplashScreen(),
    );
  }
}
