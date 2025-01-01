import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:my_phone_book/constants/colors.dart';
import 'package:my_phone_book/data/repositories/authentication/authentication_repository.dart';
import 'package:my_phone_book/features/phone_book/controller/home/home_controller.dart';
import 'package:my_phone_book/features/phone_book/view/add/add_contact_screen.dart';
import 'package:my_phone_book/features/phone_book/view/detail/detail_contact_screen.dart';
import 'package:my_phone_book/features/phone_book/view/edit/edit_contact_screen.dart';
import 'package:my_phone_book/features/phone_book/view/home/widgets/home_drawer_menu.dart';
import 'package:my_phone_book/features/phone_book/view/home/widgets/search_contact.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());
  final instance = AuthenticationRepository.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.neutral,
      appBar: AppBar(
        backgroundColor: PColors.neutral,
        centerTitle: true,
        title: const Text('My Contact'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(AddContactScreen());
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      drawer: HomeDrawerMenu(controller: controller, instance: instance),
      body: Obx(() {
        return controller.contactList.isEmpty
            ? const Center(
                child: Text('Add contact first..'),
              )
            : Column(
                children: [
                  //? search widget
                  SearchContact(
                    controller: controller,
                  ),
                  Expanded(child: Obx(() {
                    return controller.filteredContactsList.isEmpty
                        ? const Center(
                            child: Text('No Contacts Found'),
                          )
                        : ListView.builder(
                            itemCount: controller.filteredContactsList.length,
                            itemBuilder: (context, index) {
                              final contact =
                                  controller.filteredContactsList[index];
                              return Slidable(
                                key: ValueKey(contact),
                                startActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        controller.searchFocus.unfocus();
                                        controller.searchController.clear();
                                        controller.filteredContactsList.value =
                                            controller.contactList;
                                        controller.deleteContact(contact['id']);
                                      },
                                      backgroundColor: Colors.redAccent,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    )
                                  ],
                                ),
                                endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          controller.searchController.clear();
                                          controller.filteredContactsList
                                              .value = controller.contactList;
                                          Get.to(
                                            () => EditContactScreen(
                                                id: contact['id'],
                                                name: contact['name'],
                                                email: contact['email'],
                                                phoneNumber:
                                                    contact['phoneNumber']),
                                          );
                                        },
                                        backgroundColor: Colors.green,
                                        icon: Icons.edit,
                                        label: 'edit',
                                      )
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    tileColor: Colors.white,
                                    title: Text(contact['name']),
                                    subtitle: Text(contact['phoneNumber']),
                                    trailing: const Icon(
                                      Icons.chevron_right_rounded,
                                      color: PColors.border,
                                    ),
                                    leading: const CircleAvatar(
                                      backgroundColor: PColors.border,
                                      child: Icon(Icons.account_circle),
                                    ),
                                    onTap: () {
                                      Get.to(() {
                                        DetailContactScreen(
                                            contactName: contact['name'],
                                            phoneNumber: contact['phoneNumber'],
                                            emailAddress: contact['email']);
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                  }))
                ],
              );
      }),
    );
  }
}
