import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'change_language.dart';
import 'package:get/get.dart';
import 'AppTranslation.dart';
import 'mobile_number.dart';
import 'otp.dart';
import 'profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translationsKeys: AppTranslation.translationsKeys,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arimo',
      ),
      // home: changeLanguage(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => changeLanguage(),
        MobileNumber.routename: (ctx) => MobileNumber(),
        Otp.routename: (ctx) => const Otp(),
        Profile.routename: (ctx) => Profile()
      },
    );
  }
}
