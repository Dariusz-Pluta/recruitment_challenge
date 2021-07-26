import 'package:flutter/material.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/app_text.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AppElevatedButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(150.0, 25.0),
        primary: Colors.black,
        onPrimary: Color(0xffe96cbd),
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AppText(
          text: text,
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
