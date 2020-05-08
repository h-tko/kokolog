import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String text;
  final double fontSize;

  BaseText({@required this.text, this.fontSize = 17.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
