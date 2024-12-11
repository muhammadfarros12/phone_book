import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_phone_book/constants/images_string.dart';

class PFullScreenLoader {
  static void openLoadingDialog(String animation) {
    showDialog(
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        child: Container(
          color: Colors.black.withOpacity(0.7),
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: LottieBuilder.asset(
              PImage.loaderAnimation,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
