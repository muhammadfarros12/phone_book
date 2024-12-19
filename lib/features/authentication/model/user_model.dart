import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String name;
  final String username;
  final String password;
  String phoneNumber;
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.phoneNumber,
  });

  //? empty user model
  static UserModel empty() => UserModel(
        id: '',
        name: '',
        username: '',
        password: '',
        phoneNumber: '',
      );

  //? convert model to json
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Username': username,
      'Password': password,
      'PhoneNumber': phoneNumber
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        name: data['Name'] ?? '',
        username: data['Username'] ?? '',
        password: data['Password'] ?? '',
        phoneNumber: data['Phonenumber'] ?? '',
      );
    }
    return UserModel.empty();
  }
}
