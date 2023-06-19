import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:untitled_getx_fb/screen/cart/view/cart_screen.dart';
import 'package:untitled_getx_fb/screen/home/view/home_screen.dart';
import 'package:untitled_getx_fb/screen/profile/view/profile_screen.dart';
import '../../bottombarsearch/view/bottombarsearch_screen.dart';

class HomeController extends GetxController {
  RxBool signinEye = true.obs;
  RxBool signupEye = true.obs;

  PersistentTabController persistentTabController = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> screen() {
    return [
      const HomeScreen(),
      const BottombarsearchScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> item() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
        textStyle: GoogleFonts.secularOne(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.teal,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
        textStyle: GoogleFonts.secularOne(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.teal,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
        textStyle: GoogleFonts.secularOne(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.teal,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
        textStyle: GoogleFonts.secularOne(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.teal,
        ),
      ),
    ];
  }
}
