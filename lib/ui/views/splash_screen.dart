import 'package:adroit/styles/colors.dart';
import 'package:adroit/ui/views/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        ),
      );
    });
    return Container(
      color: kPrimaryColor,
      child: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: const Color(0xffcaaf65),
          child: Text(
            "Adroit",
            /// TODO: Remove the use of the text theme
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }
}
