import 'package:flutter/material.dart';
import 'package:my_phone_book/constants/colors.dart';

class PElevatedButtonTheme {
  PElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: PColors.primary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: const Color.fromARGB(255, 100, 94, 94),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

}
