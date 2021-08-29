import 'package:adroit/ui/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) => HomeScreen(),
    //     ),
    //   );
    // });
    return Scaffold(
      body: Container(
        color: Color(0xff39A6A3),
        child: Center(
          child: Shimmer.fromColors(
            baseColor: Theme.of(context).primaryColor,
            highlightColor: Theme.of(context).accentColor,
            child: Text(
              "Adroit",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}
