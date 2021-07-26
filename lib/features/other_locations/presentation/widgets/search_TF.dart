import 'package:flutter/material.dart';
import 'package:recruitment_challenge/generated/l10n.dart';

class SearchTF extends StatelessWidget {
  final TextEditingController controller;
  const SearchTF({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: false,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        hintText: Strings.of(context).search,
        hintStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 20.0,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
          size: 20.0,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        contentPadding: EdgeInsets.all(5.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
