import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_phone_book/constants/sizes.dart';
import 'package:my_phone_book/features/authentication/controller/signup/signup_controller.dart';
import 'package:my_phone_book/features/authentication/view/signup/widgets/terms_condition_checkbox.dart';
import 'package:my_phone_book/utils/validators/validator.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return  Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          //? name
          TextFormField(
            validator: (value) => PValidator.validatorEmptyText('Name', value),
            controller: controller.name,
            expands: false,
            decoration: const InputDecoration(
                labelText: "Name", prefixIcon: Icon(Iconsax.user)),
          ),
          const SizedBox(height: PSize.spaceBtwInputFields),

          //? userName
          TextFormField(
            expands: false,
            validator: (value) =>
                PValidator.validatorEmptyText('username', value),
            controller: controller.username,
            decoration: const InputDecoration(
                labelText: "Username", prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: PSize.spaceBtwInputFields),

          //? email
          TextFormField(
            expands: false,
            validator: (value) => PValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
                labelText: "Email", prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: PSize.spaceBtwInputFields),

          //? phoneNumber
          TextFormField(
            validator: (value) => PValidator.validatePhoneNumber(value),
            expands: false,
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
                labelText: "Phone Number", prefixIcon: Icon(Iconsax.call)),
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

          const SizedBox(height: PSize.spaceBtwSections),

          //? Terms
          const TermsConditianCheckbox(),
          const SizedBox(height: PSize.spaceBtwSections),

          //? Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text("Create Account"),
            ),
          )
        ],
      ),
    );
;
  }
}