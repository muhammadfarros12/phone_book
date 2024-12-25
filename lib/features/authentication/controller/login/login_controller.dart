import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_phone_book/constants/images_string.dart';
import 'package:my_phone_book/data/repositories/authentication/authentication_repository.dart';
import 'package:my_phone_book/utils/helper/network_manager.dart';
import 'package:my_phone_book/utils/popups/full_screen_loader.dart';
import 'package:my_phone_book/utils/popups/status_snackbar.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    if (localStorage.read('REMEMBER_ME_EMAIL').toString() != 'null' && localStorage.read('REMEMBER_ME_PASSWORD').toString() != 'null') {
      email.text = localStorage.read('REMEMBER_ME_EMAIL').toString();
      password.text = localStorage.read('REMEMBER_ME_PASSWORD').toString();
    }
    super.onInit();
  }

  //? email and password sign in
  Future<void> emailAndPasswordsignIn() async{
    try {
      // start loading
      PFullScreenLoader.openLoadingDialog(PImage.loaderAnimation);
      // internet check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return; 
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // remember me if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // login user using email and password authentication 
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      PFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnakbar(title: 'Oh Snap', message: e.toString());
    }
  }

  
}