import 'package:flutter/material.dart';
import 'package:my_phone_book/constants/images_string.dart';
import 'package:my_phone_book/constants/sizes.dart';
import 'package:my_phone_book/constants/text_string.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Image(
            height: 150,
            image: AssetImage(PImage.logo),
          ),
        ),
         const SizedBox(
          height: PSize.xl,
        ),
        Text(
          PText.titleLogin,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: PSize.sm,
        ),
        Text(
          PText.subTitleLogin,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
