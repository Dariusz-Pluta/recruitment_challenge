import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Gradient gradient = LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      colors: [
        Colors.black.withOpacity(0.7),
        Colors.black.withOpacity(0.8),
      ],
      stops: [
        0.5,
        1.0
      ]);
}
