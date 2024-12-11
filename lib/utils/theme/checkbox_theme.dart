import 'package:flutter/material.dart';
import 'package:my_phone_book/constants/colors.dart';

class PCheckboxTheme {
  PCheckboxTheme._();

  static CheckboxThemeData lightCheckboxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return PColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

}
