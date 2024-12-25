import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_phone_book/constants/images_string.dart';
import 'package:my_phone_book/data/repositories/authentication/authentication_repository.dart';
import 'package:my_phone_book/data/repositories/user/user_repositories.dart';
import 'package:my_phone_book/features/authentication/model/user_model.dart';
import 'package:my_phone_book/utils/helper/network_manager.dart';
import 'package:my_phone_book/utils/popups/full_screen_loader.dart';
import 'package:my_phone_book/utils/popups/status_snackbar.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //? variable
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final name = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  //? sign up
  void signup() async {
    try {
      //start loading
      PFullScreenLoader.openLoadingDialog(PImage.loaderAnimation);

      // check internet conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove loading
        PFullScreenLoader.stopLoading();
        return;
      }

      // privacy policy checked
      if (!privacyPolicy.value) {
        PFullScreenLoader.stopLoading();

        PLoaders.warningSnakbar(
            title: 'Accept Privacy Policy',
            message:
                "in order to create account, you must have to read and accept the privacy policy & terms of us");

        return;
      }

      // register user in the firebase authentication
      final userCredential = await AuthenticationRepository.instance
          .registerEmailAndPassword(email.text.trim(), password.text.trim());

      // save authenticator
      final newUser = UserModel(
          id: userCredential.user!.uid,
          name: name.text.trim(),
          username: username.text.trim(),
          password: password.text.trim(),
          phoneNumber: phoneNumber.text.trim());

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // show success
      PLoaders.successSnakbar(
          title: "Congratulations",
          message: "Your account have been created! Verivy email to continue.");

      // move to verify email
          //   Get.to(() => VerifyEmailScreen(
          //   email: email.text.trim(),
          // ));
    } catch (e) {
      PFullScreenLoader.stopLoading();

      // show some generic error
      PLoaders.errorSnakbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
