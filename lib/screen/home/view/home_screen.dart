import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled_getx_fb/screen/home/controller/home_controller.dart';
import '../../../utils/fb_helper.dart';
import '../modal/home_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfffef2fe),
        body: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.shopping_bag,
                      color: Colors.teal,
                      size: 40,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 7,
                            ),
                            child: Text(
                              "Shopping City",
                              style: GoogleFonts.secularOne(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.teal,
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
                      final snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: "Success",
                          message: "logout successfully !",
                          contentType: ContentType.success,
                        ),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                      Get.offAndToNamed('signin_screen');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 6,
                      ),
                      child: Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.logout,
                          color: Colors.teal,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 10,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 30,
                        right: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/6.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: double.infinity,
                              width: double.infinity,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Summer",
                                      style: GoogleFonts.dancingScript(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Iphone 14",
                                      style: GoogleFonts.tiltPrism(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "SALE",
                                      style: GoogleFonts.secularOne(
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 5,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "----- UPTO -----",
                                      style: GoogleFonts.secularOne(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        letterSpacing: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      " 10 %",
                                      style: GoogleFonts.anton(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.white,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "All Categories",
                        style: GoogleFonts.secularOne(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.toNamed('search_screen');
                        },
                        child: Text(
                          "See all",
                          style: GoogleFonts.secularOne(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 70,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  homeController.category.value = "Mobiles";
                                  FbHelper.fbHelper.readCategoryData(
                                      homeController.category.value);
                                  Get.toNamed('categorydata_screen');
                                },
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.teal.shade100,
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18),
                                    child: Image.asset(
                                      "assets/images/7.png",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Mobile",
                                style: GoogleFonts.secularOne(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 70,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  homeController.category.value = "TVs";
                                  FbHelper.fbHelper.readCategoryData(
                                      homeController.category.value);
                                  Get.toNamed('categorydata_screen');
                                },
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.teal.shade100,
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18),
                                    child: Image.asset(
                                      "assets/images/8.png",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "TV",
                                style: GoogleFonts.secularOne(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 70,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  homeController.category.value = "Wearables";
                                  FbHelper.fbHelper.readCategoryData(
                                      homeController.category.value);
                                  Get.toNamed('categorydata_screen');
                                },
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.teal.shade100,
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18),
                                    child: Image.asset(
                                      "assets/images/9.png",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Watch",
                                style: GoogleFonts.secularOne(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 70,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  homeController.category.value = "Laptops";
                                  FbHelper.fbHelper.readCategoryData(
                                      homeController.category.value);
                                  Get.toNamed('categorydata_screen');
                                },
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.teal.shade100,
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18),
                                    child: Image.asset(
                                      "assets/images/10.png",
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Laptop",
                                style: GoogleFonts.secularOne(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Popular Item",
                        style: GoogleFonts.secularOne(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.toNamed('search_screen');
                        },
                        child: Text(
                          "See all",
                          style: GoogleFonts.secularOne(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: FbHelper.fbHelper.readItem(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  List<HomeModal> dataList = [];
                  QuerySnapshot? snapData = snapshot.data;
                  for (var x in snapData!.docs) {
                    Map? data = x.data() as Map;
                    String name = data['name'];
                    String price = data['price'];
                    String description = data['description'];
                    String offer = data['offer'];
                    String category = data['category'];
                    String? image = data['image'];
                    HomeModal homeModal = HomeModal(
                      name: name,
                      price: price,
                      category: category,
                      offer: offer,
                      description: description,
                      id: x.id,
                      image: image,
                    );
                    dataList.add(homeModal);
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 240,
                        ),
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.teal.shade100,
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 40,
                                    width: 65,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                      color: Colors.red,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${dataList[index].offer} %",
                                      style: GoogleFonts.secularOne(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: dataList[index].image == null
                                              ? Image.asset(
                                                  "assets/images/2.png",
                                                  height: 100,
                                                  width: 100,
                                                )
                                              : Image.memory(
                                                  base64Decode(
                                                    dataList[index]
                                                        .image
                                                        .toString(),
                                                  ),
                                                  height: 100,
                                                  width: 100,
                                                ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${dataList[index].name}",
                                        style: GoogleFonts.secularOne(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "${dataList[index].category}",
                                        style: GoogleFonts.secularOne(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "₹ ${dataList[index].price}",
                                        style: GoogleFonts.secularOne(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
