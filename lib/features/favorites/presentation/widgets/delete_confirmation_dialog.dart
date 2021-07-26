import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/app_text.dart';
import 'package:recruitment_challenge/generated/l10n.dart';

import 'app_elevated_button.dart';

class DeleteConfirmationDialog extends StatefulWidget {
  final String text;
  DeleteConfirmationDialog({
    Key? key,
    required this.text,
  }) : super(key: key);
  @override
  _DeleteConfirmationDialogState createState() =>
      _DeleteConfirmationDialogState();
}

class _DeleteConfirmationDialogState extends State<DeleteConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return new BackdropFilter(
      filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
      child: Dialog(
        backgroundColor: Colors.white.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          height: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppText(text: widget.text, fontSize: 35.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppElevatedButton(
                    text: Strings.of(context).yes,
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                  AppElevatedButton(
                    text: Strings.of(context).no,
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
