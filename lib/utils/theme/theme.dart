import 'package:flutter/material.dart';
import 'package:my_phone_book/constants/colors.dart';
import 'package:my_phone_book/utils/theme/checkbox_theme.dart';
import 'package:my_phone_book/utils/theme/chip_theme.dart';
import 'package:my_phone_book/utils/theme/elevated_button_theme.dart';
import 'package:my_phone_book/utils/theme/outlined_button_theme.dart';
import 'package:my_phone_book/utils/theme/text_field_theme.dart';

class PAppTheme {
  PAppTheme._(); //to avoid creating instance

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: PColors.primary,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: PElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: POutlinedButton.lightOutlinedButtonTheme,
    chipTheme: PChipTheme.lightChipTheme,
    inputDecorationTheme: PTextFormFieldTheme.lightInputDecorationTheme,
    checkboxTheme: PCheckboxTheme.lightCheckboxThemeData,
  );
}
