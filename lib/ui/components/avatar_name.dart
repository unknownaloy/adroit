import 'package:flutter/material.dart';

class AvatarName extends StatelessWidget {
  const AvatarName({Key? key}) : super(key: key);

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
          "John Doe",
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
