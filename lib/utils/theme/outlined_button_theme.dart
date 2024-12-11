import 'package:flutter/material.dart';
import 'package:my_phone_book/constants/colors.dart';

class POutlinedButton {
  POutlinedButton._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side:const BorderSide(color: PColors.primary),
      textStyle:const TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
  );
}
