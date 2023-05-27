import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_getx_fb/utils/fb_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FlutterLogo(
                size: 100,
              ),
            ),
            TextButton(
              onPressed: () {
                FbHelper.fbHelper.signOut();
                Get.offAndToNamed('signin_screen');
              },
              child: Text(
                "log out",
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
              style: ButtonStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
