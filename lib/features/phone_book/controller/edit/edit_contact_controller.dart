import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_phone_book/constants/images_string.dart';
import 'package:my_phone_book/data/repositories/home/home_repository.dart';
import 'package:my_phone_book/features/phone_book/controller/home/home_controller.dart';
import 'package:my_phone_book/utils/helper/network_manager.dart';
import 'package:my_phone_book/utils/popups/full_screen_loader.dart';
import 'package:my_phone_book/utils/popups/status_snackbar.dart';

class EditContactController extends GetxController {
  static EditContactController get instance => Get.find();

  final homeRepository = HomeRepository.instance;
  final homeController = HomeController.instance;
  final email = TextEditingController();
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  String? id;
  GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

  void saveContact() async {
    try {
      PFullScreenLoader.openLoadingDialog(PImage.loaderAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!addFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      await homeRepository.updateContact(
          id!, name.text, email.text, phoneNumber.text);
      homeController.fetchContacts();

      // show success
      PLoaders.successSnakbar(
          title: "Succes", message: "Your contact success updated.");

      // Get.off(page)
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnakbar(title: 'Oh snap!', message: e.toString());
    }
  }
}
