import 'package:get/get.dart';
import 'package:my_phone_book/utils/helper/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}