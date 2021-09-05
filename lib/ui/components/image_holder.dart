import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageHolder extends StatelessWidget {
  final String imageUrl;
  const ImageHolder({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      progressIndicatorBuilder: (_, __, ___) => Text("Hello world..."),
      maxWidthDiskCache: 640,
      maxHeightDiskCache: 320,
      imageUrl: imageUrl,
      fit: BoxFit.cover,
    );
  }
}
