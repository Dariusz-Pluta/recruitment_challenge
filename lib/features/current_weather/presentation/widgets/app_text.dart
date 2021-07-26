import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign alignment;

  const AppText({
    Key? key,
    required this.text,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.amber,
    this.alignment = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textAlign: alignment,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
