import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled_getx_fb/screen/bottombar/view/bottombar_screen.dart';
import 'package:untitled_getx_fb/screen/buy/view/buydetail_screen.dart';
import 'package:untitled_getx_fb/screen/buy/view/payment_screen.dart';
import 'package:untitled_getx_fb/screen/cart/view/cart_screen.dart';
import 'package:untitled_getx_fb/screen/categorydata/view/categorydata_screen.dart';
import 'package:untitled_getx_fb/screen/detail/view/detail_screen.dart';
import 'package:untitled_getx_fb/screen/home/view/home_screen.dart';
import 'package:untitled_getx_fb/screen/profile/view/profile_screen.dart';
import 'package:untitled_getx_fb/screen/search/view/search_screen.dart';
import 'package:untitled_getx_fb/screen/signin/view/signin_screen.dart';
import 'package:untitled_getx_fb/screen/signup/view/signup_screen.dart';
import 'package:untitled_getx_fb/screen/splash/view/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>
          GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: [
              GetPage(
                name: '/',
                page: () => const SplashScreen(),
              ),
              GetPage(
                name: '/signin_screen',
                page: () => const SigninScreen(),
              ),
              GetPage(
                name: '/signup_screen',
                page: () => const SignupScreen(),
              ),
              GetPage(
                name: '/bottombar_screen',
                page: () => const BottombarScreen(),
              ),
              GetPage(
                name: '/home_screen',
                page: () => const HomeScreen(),
              ),
              GetPage(
                name: '/search_screen',
                page: () => const SearchScreen(),
              ),
              GetPage(
                name: '/categorydata_screen',
                page: () => const CategorydataScreen(),
              ),
              GetPage(
                name: '/cart_screen',
                page: () => const CartScreen(),
              ),
              GetPage(
                name: '/profile_screen',
                page: () => const ProfileScreen(),
              ),
              GetPage(
                name: '/detail_screen',
                page: () => const DetailScreen(),
              ),
              GetPage(
                name: '/buydetail_screen',
                page: () => const BuydetailScreen(),
              ),
              GetPage(
                name: '/payment_screen',
                page: () => const PaymentScreen(),
              ),
            ],
          ),
    ),
  );
}
// admin ====================================================================

// snackbar using fb helper

// Wearables == Watch

// text size of container

// image size == child: dataList[index].image == null
//                                                 ? Image.asset(
//                                                     "assets/images/2.png",
//                                                     height: 100,
//                                                     width: 100,
//                                                   )
//                                                 : Image.memory(
//                                                     base64Decode(
//                                                       dataList[index]
//                                                           .image
//                                                           .toString(),
//                                                     ),
//                                                     height: 100,
//                                                     width: 100,
//                                                   ),

// remove user modal
