import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_phone_book/exceptions/firebase_exceptions.dart';
import 'package:my_phone_book/exceptions/format_exceptions.dart';
import 'package:my_phone_book/exceptions/platform_exceptions.dart';
import 'package:my_phone_book/features/authentication/model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async{
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e){
      throw PFirebaseExceptions(e.code).message;
    } on FormatException catch (_){
      throw PFormatExceptions();
    } on PlatformException catch(e){
      throw PPlatformExceptions(e.code).message;
    } catch (e){
      throw 'Somthing went wrong. Please try again';
    }
  }


}