import 'package:flutter/material.dart';
import 'package:my_phone_book/constants/colors.dart';
import 'package:my_phone_book/constants/sizes.dart';
import 'package:my_phone_book/constants/text_string.dart';
import 'package:my_phone_book/features/authentication/view/signup/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.neutral,
      appBar: AppBar(
        backgroundColor: PColors.neutral,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSize.defaultSpace),
          child: Column(
            children: [
              Text(
                PText.titleRegister,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SignupForm()
            ],
          ),
        ),
      ),
    );
  }
}
