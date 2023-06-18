import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled_getx_fb/utils/fb_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    isLogin = FbHelper.fbHelper.checkUser();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => isLogin == true
          ? Get.offAndToNamed('bottombar_screen')
          : Get.offAndToNamed('signin_screen'),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfffef2fe),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_bag,
                color: Colors.teal,
                size: 160,
              ),
              Text(
                "Shopping City",
                style: GoogleFonts.secularOne(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.teal,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
