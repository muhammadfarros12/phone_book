import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_phone_book/binding/general_binding.dart';
import 'package:my_phone_book/constants/colors.dart';
import 'package:my_phone_book/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: PAppTheme.lightTheme,
      initialBinding: GeneralBinding(),
      home: const Scaffold(
        backgroundColor: PColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
