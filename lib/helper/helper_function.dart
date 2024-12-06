import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PHelperFunction {
  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }

  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }
}