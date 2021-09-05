import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class ImageHolder extends StatelessWidget {
  final String imageUrl;
  final String blurHash;
  const ImageHolder({
    Key? key,
    required this.imageUrl,
    required this.blurHash,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      progressIndicatorBuilder: (_, __, ___) => BlurHash(hash: blurHash),
      imageUrl: imageUrl,
      fit: BoxFit.cover,
    );
  }
}
