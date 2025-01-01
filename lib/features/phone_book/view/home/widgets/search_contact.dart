import 'package:flutter/material.dart';

import '../../../controller/home/home_controller.dart';

class SearchContact extends StatelessWidget {
  const SearchContact({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        focusNode: controller.searchFocus,
        controller: controller.searchController,
        onChanged: (query) {
          print("ini adalah $query");
          controller.searchContacts(query);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search contact',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}