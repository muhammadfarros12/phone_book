import 'package:flutter/material.dart';
import 'package:my_phone_book/common/styles/spacing_spaces.dart';
import 'package:my_phone_book/constants/sizes.dart';
import 'package:my_phone_book/utils/helper/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingSpaces.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //? image
              Image(
                image: AssetImage(image),
                width: PHelperFunction.screenWidth() * .6,
              ),
              const SizedBox(
                height: PSize.spaceBtwSections,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PSize.spaceBtwItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PSize.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text('continue')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
