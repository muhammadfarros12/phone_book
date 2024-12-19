import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_phone_book/exceptions/firebase_auth_exceptions.dart';
import 'package:my_phone_book/exceptions/firebase_exceptions.dart';
import 'package:my_phone_book/exceptions/format_exceptions.dart';
import 'package:my_phone_book/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //? variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async{
    final user = _auth.currentUser;

    if (user != null) {
      await user.reload();
      if (user.emailVerified) {
        
      } else {
        await deviceStorage.erase();

      }
    } else {

    }
  }

  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async{
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthExceptions(e.code).message;
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

  Future<UserCredential> registerEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthExceptions(e.code).message;
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

  Future<void> sendEmailVerification() async{
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthExceptions(e.code).message;
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

  Future<void> logout() async{
    try {
      await FirebaseAuth.instance.signOut();

    } on FirebaseAuthException catch (e) {
      throw PFirebaseAuthExceptions(e.code).message;
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