import 'package:flutter/material.dart';
import 'package:my_phone_book/constants/colors.dart';

class DetailContactScreen extends StatelessWidget {
  const DetailContactScreen({
    super.key,
    required this.contactName,
    required this.phoneNumber,
    required this.emailAddress,
  });

  final String contactName;
  final String phoneNumber;
  final String emailAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.neutral,
      appBar: AppBar(
        backgroundColor: PColors.neutral,
        title: const Text('Detail Contact'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[200],
              child: const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              contactName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    phoneNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8)
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
