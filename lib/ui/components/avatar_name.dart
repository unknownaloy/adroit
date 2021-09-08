import 'package:flutter/material.dart';

class AvatarName extends StatelessWidget {
  final String name;
  const AvatarName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.orange,
          radius: 24.0,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
