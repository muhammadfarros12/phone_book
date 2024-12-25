import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_phone_book/constants/sizes.dart';
import 'package:my_phone_book/constants/text_string.dart';
import 'package:my_phone_book/features/authentication/controller/login/login_controller.dart';
import 'package:my_phone_book/utils/validators/validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PSize.spaceBtwSections),
        child: Column(
          children: [
            //? email
            TextFormField(
              controller: controller.email,
              validator: (value) => PValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "Email",
              ),
            ),
            const SizedBox(height: PSize.spaceBtwInputFields),

            //? password
            Obx(() {
              return TextFormField(
                validator: (value) => PValidator.validatePassword(value),
                expands: false,
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  ),
                ),
              );
            }),
            const SizedBox(height: PSize.spaceBtwInputFields),

            //? Remember me
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() {
                      return Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value);
                    }),
                    const Text("remember me"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: PSize.spaceBtwSections),
             //? Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordsignIn(),
                child: const Text(PText.btnSignIn),
              ),
            ),
            const SizedBox(height: PSize.spaceBtwItems),
            //? Create Account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed:(){},
                child: const Text(PText.btnRegister),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}