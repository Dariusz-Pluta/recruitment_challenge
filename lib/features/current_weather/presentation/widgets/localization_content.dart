import 'package:flutter/material.dart';

import 'app_text.dart';

class LocalizationContent extends StatelessWidget {
  final String address;

  const LocalizationContent({Key? key, required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppText(
      text: address,
      fontSize: 45.0,
    );
  }
}
