import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_phone_book/exceptions/firebase_exceptions.dart';
import 'package:my_phone_book/exceptions/format_exceptions.dart';
import 'package:my_phone_book/exceptions/platform_exceptions.dart';
import 'package:my_phone_book/features/authentication/model/user_model.dart';

class HomeRepository extends GetxController {
  static HomeRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot =
          await _db.collection('Users').doc(authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw PFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw PFormatExceptions();
    } on PlatformException catch (e) {
      throw PPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing went wrong. Please try again';
    }
  }

  Future<void> adContact(String name, String email, String phoneNumber) async {
    try {
      final contactRef = _db
          .collection('Contacts')
          .doc(authUser?.uid)
          .collection('UsersContact')
          .doc();

      await contactRef
          .set({'id': contactRef.id, 'Name': name, 'PhoneNumber': phoneNumber});
    } on FirebaseException catch (e) {
      throw PFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw PFormatExceptions();
    } on PlatformException catch (e) {
      throw PPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing went wrong. Please try again';
    }
  }

  Future<List<Map<String, dynamic>>> getContact() async {
    try {
      final contactSnapshot = await _db
          .collection('Contacts')
          .doc(authUser?.uid)
          .collection('UserContacts')
          .get();

      return contactSnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'Name': doc['Name'],
          'Email': doc['Email'],
          'PhoneNumber': doc['PhoneNumber'],
        };
      }).toList();
    } on FirebaseException catch (e) {
      throw PFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw PFormatExceptions();
    } on PlatformException catch (e) {
      throw PPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing went wrong. Please try again';
    }
  }

  Future<void> updateContact(
      String contactId, String name, String email, String phoneNumber) async {
    try {
      final userUid = authUser?.uid;
      final contactRef = _db
          .collection('Contacts')
          .doc(userUid)
          .collection('UserContacts')
          .doc(contactId);

      await contactRef
          .update({'Name': name, 'Email': email, 'PhoneNumber': phoneNumber});
    } on FirebaseException catch (e) {
      throw PFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw PFormatExceptions();
    } on PlatformException catch (e) {
      throw PPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing went wrong. Please try again';
    }
  }

  Future<bool> deleteContact(String contactId) async{
    try {
      final userUid = authUser?.uid;
      final contactRef = _db
      .collection('Contacts')
      .doc(userUid)
      .collection('UserContacts')
      .doc(contactId);

      await contactRef.delete();
      return true;
    } on FirebaseException catch (_) {
      return false;
    } on FormatException catch (_) {
      return false;
    } on PlatformException catch (_) {
      return false;
    } catch (_) {
      return false; 
    }
  }
}
