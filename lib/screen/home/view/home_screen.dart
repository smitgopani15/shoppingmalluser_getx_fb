import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled_getx_fb/screen/home/controller/home_controller.dart';
import 'package:untitled_getx_fb/utils/fb_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );
  PageController pageController = PageController();

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 60,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 7,
                            ),
                            child: Text(
                              "Shopping City",
                              style: GoogleFonts.secularOne(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      FbHelper.fbHelper.signOut();
                      Get.offAndToNamed('signin_screen');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 6,
                      ),
                      child: Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // SizedBox(
            //   height: 180,
            //   child: PageView(
            //     controller: pageController,
            //     onPageChanged: (value) {
            //       homeController.pageValue.value = value;
            //     },
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.only(
            //           left: 20,
            //           right: 20,
            //         ),
            //         child: Container(
            //           height: double.infinity,
            //           width: double.infinity,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20),
            //             color: Colors.white,
            //           ),
            //           // alignment: Alignment.center,
            //           // child: ClipRRect(
            //           //   borderRadius: BorderRadius.circular(20),
            //           //   child: Image.asset(
            //           //     "",
            //           //   ),
            //           // ),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(
            //           left: 20,
            //           right: 20,
            //         ),
            //         child: Container(
            //           height: double.infinity,
            //           width: double.infinity,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20),
            //             color: Colors.white,
            //           ),
            //           // alignment: Alignment.center,
            //           // child: ClipRRect(
            //           //   borderRadius: BorderRadius.circular(20),
            //           //   child: Image.asset(
            //           //     "",
            //           //   ),
            //           // ),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(
            //           left: 20,
            //           right: 20,
            //         ),
            //         child: Container(
            //           height: double.infinity,
            //           width: double.infinity,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20),
            //             color: Colors.white,
            //           ),
            //           // alignment: Alignment.center,
            //           // child: ClipRRect(
            //           //   borderRadius: BorderRadius.circular(20),
            //           //   child: Image.asset(
            //           //     "",
            //           //   ),
            //           // ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // SmoothPageIndicator(
            //   controller: pageController,
            //   count: 3,
            //   onDotClicked: (index) {
            //     pageController.animateToPage(
            //       index,
            //       duration: Duration(
            //         microseconds: 500,
            //       ),
            //       curve: Curves.easeIn,
            //     );
            //   },
            //   effect: WormEffect(
            //     dotColor: Colors.grey.shade700,
            //     activeDotColor: Colors.white,
            //     dotHeight: 5,
            //     dotWidth: 10,
            //     spacing: 10,
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                height: 100,
                width: double.infinity,
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
