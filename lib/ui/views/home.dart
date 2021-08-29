import 'package:adroit/services/wallpaper_service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WallpaperService().getListOfPhotos();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Hello world!!!"),
        ),
      ),
    );
  }
}
