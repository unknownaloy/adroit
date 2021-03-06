import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarName extends StatelessWidget {
  final String artistImage;
  final String artistName;
  const AvatarName({Key? key, required this.artistImage, required this.artistName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 24.0,
          backgroundColor: Colors.orange,
          backgroundImage: CachedNetworkImageProvider(artistImage),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Flexible(
          child: Text(
            artistName,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
