import 'package:adroit/bloc/home/home_bloc.dart';
import 'package:adroit/bloc/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Adroit',
      theme: lightTheme(),
      home: const SplashScreen(),
    );
  }
}
