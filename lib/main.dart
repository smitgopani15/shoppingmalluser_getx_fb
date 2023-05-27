import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled_getx_fb/screen/home/view/home_screen.dart';
import 'package:untitled_getx_fb/screen/signin/view/signin_screen.dart';
import 'package:untitled_getx_fb/screen/signup/view/signup_screen.dart';
import 'package:untitled_getx_fb/screen/splash/view/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/',
            page: () => SplashScreen(),
          ),
          GetPage(
            name: '/signin_screen',
            page: () => SigninScreen(),
          ),
          GetPage(
            name: '/signup_screen',
            page: () => SignupScreen(),
          ),
          GetPage(
            name: '/home_screen',
            page: () => HomeScreen(),
          ),
        ],
      ),
    ),
  );
}
