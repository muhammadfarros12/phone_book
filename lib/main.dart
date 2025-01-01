import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_phone_book/app.dart';
import 'package:my_phone_book/data/repositories/authentication/authentication_repository.dart';
import 'package:my_phone_book/firebase_options.dart';

void main() async {
  //? add widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //? initialize local storage
  await GetStorage.init();

  //? await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //? Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const App());
}
