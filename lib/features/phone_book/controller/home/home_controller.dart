import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_phone_book/constants/images_string.dart';
import 'package:my_phone_book/data/repositories/home/home_repository.dart';
import 'package:my_phone_book/utils/popups/full_screen_loader.dart';
import 'package:my_phone_book/utils/popups/status_snackbar.dart';


class HomeController extends GetxController {

  static HomeController get instance => Get.find();

  final homeRepository = Get.put(HomeRepository());
  var userData = {}.obs;
  var contactList = <Map<String, dynamic>>[].obs;

  RxString name = "".obs;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();
  RxString seachQuery = ''.obs;
  var filteredContactsList = <Map<String, dynamic>>[].obs;

  fetchUserDetail() async{
    final fetchedData = await homeRepository.fetchUserDetails();
    userData.value = fetchedData.toJson();
  }

  void fetchContacts() async {
    final fetchedConctact = await homeRepository.getContact();
    contactList.value = fetchedConctact;
  }

  void deleteContact(String id) async{
    PFullScreenLoader.openLoadingDialog(PImage.loaderAnimation);

    final isDeleted = await homeRepository.deleteContact(id);

    if (isDeleted){
      fetchContacts();
      PFullScreenLoader.stopLoading();
      PLoaders.successSnakbar(title: "Success", message: "Your contact success delete");
    } else {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnakbar(title: "Error", message: "Your contact can't be deleted");
    }
  }

  // search
  searchContacts(String query){
    seachQuery.value = query;

    if (query.isEmpty) {
      filteredContactsList.value = contactList;
    } else{
      filteredContactsList.value = contactList.where((contact){
        final nameLower = contact['Name'].toLowerCase;
        final searchLower = query.toLowerCase();
        return nameLower.contains(searchLower);
      }).toList();
    }
  }

  @override
  void onReady() {
    searchContacts('');
    super.onReady();
  }

  @override
  void onInit() {
    fetchContacts();
    fetchUserDetail();
    super.onInit();
  }

  
}