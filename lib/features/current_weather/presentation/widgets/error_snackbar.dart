import 'package:flutter/material.dart';
import 'package:recruitment_challenge/generated/l10n.dart';

import 'app_text.dart';

class ErrorSnackbar extends SnackBar {
  final BuildContext context;
  final String text;

  ErrorSnackbar({
    required this.context,
    required this.text,
  }) : super(
          content: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.black,
                  size: 30.0,
                ),
                SizedBox(width: 15.0),
                Expanded(
                  child: AppText(
                    text: Strings.of(context).error + ' ' + text,
                    alignment: TextAlign.start,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          behavior: SnackBarBehavior.floating,
        );
}
