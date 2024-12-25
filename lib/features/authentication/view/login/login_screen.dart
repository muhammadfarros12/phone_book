import 'package:flutter/material.dart';
import 'package:my_phone_book/common/styles/spacing_spaces.dart';
import 'package:my_phone_book/constants/colors.dart';
import 'package:my_phone_book/constants/sizes.dart';
import 'package:my_phone_book/features/authentication/view/login/widgets/login_form.dart';
import 'package:my_phone_book/features/authentication/view/login/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: PColors.neutral,
      body: SingleChildScrollView(
        padding: PSpacingSpaces.paddingWithAppBarHeight,
        child: Column(
          children: [
            SizedBox(
              height: PSize.lg,
            ),
            LoginHeader(),
            LoginForm()
          ],
        ),
      ),
    );
  }
}