import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_phone_book/constants/images_string.dart';
import 'package:my_phone_book/data/repositories/home/home_repository.dart';
import 'package:my_phone_book/main.dart';
import 'package:my_phone_book/utils/helper/network_manager.dart';
import 'package:my_phone_book/utils/popups/full_screen_loader.dart';
import 'package:my_phone_book/utils/popups/status_snackbar.dart';

class AddContactController extends GetxController {
  static AddContactController get instance => Get.find();

  // variable
  final homeRepository = HomeRepository.instance;
  final homeController = HomeRepository.instance;

  final email = TextEditingController();
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

  void addContact() async {
    try {
      PFullScreenLoader.openLoadingDialog(PImage.loaderAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      if (!addFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
      }

      await homeRepository.adContact(name.text, email.text, phoneNumber.text);
      homeController.fetchUserDetails();

      // show success snackbar
      PLoaders.successSnakbar(
        title: 'Success',
        message: 'Your contact have been added',
      );

      // Get.off(() => MyApp());
    } catch (e) {
      // remove loader
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnakbar(
        title: 'Error',
        message: e.toString(),
      );
    }
  }
}
