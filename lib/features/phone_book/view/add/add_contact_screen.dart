import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_phone_book/constants/colors.dart';
import 'package:my_phone_book/constants/sizes.dart';
import 'package:my_phone_book/features/phone_book/controller/add/add_contact_controller.dart';
import 'package:my_phone_book/utils/validators/validator.dart';

class AddContactScreen extends StatelessWidget {
  AddContactScreen({super.key});

  final controller = Get.put(AddContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.neutral,
      appBar: AppBar(
        backgroundColor: PColors.neutral,
        centerTitle: true,
        title: const Text('Create Contact'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSize.defaultSpace),
          child: Form(
              key: controller.addFormKey,
              child: Column(
                children: [
                  //? name
                  TextFormField(
                    validator: (value) {
                      PValidator.validatorEmptyText('Name', value);
                      return null;
                    },
                    controller: controller.name,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),

                  const SizedBox(
                    height: PSize.spaceBtwInputFields,
                  ),
                  //? email
                  TextFormField(
                    validator: (value) {
                      PValidator.validateEmail(value);
                      return null;
                    },
                    controller: controller.email,
                    decoration: const InputDecoration(
                        labelText: 'Email', prefixIcon: Icon(Iconsax.direct)),
                  ),
                  const SizedBox(
                    height: PSize.spaceBtwInputFields,
                  ),

                  //? phone number
                  TextFormField(
                    validator: (value) {
                      PValidator.validatePhoneNumber(value);
                      return null;
                    },
                    controller: controller.phoneNumber,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Iconsax.call),
                    ),
                  ),

                  const SizedBox(
                    height: PSize.spaceBtwInputFields,
                  ),
                  const SizedBox(
                    height: PSize.spaceBtwSections,
                  ),

                  //? create button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.addContact();
                        },
                        child: const Text('Create Contact')),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
