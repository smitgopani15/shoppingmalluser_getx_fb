import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/fb_helper.dart';
import '../../home/controller/home_controller.dart';
import '../../home/modal/home_modal.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );
  TextEditingController searchc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfffef2fe),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: searchc,
                                textInputAction: TextInputAction.next,
                                cursorColor: Colors.teal,
                                style: GoogleFonts.secularOne(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: GoogleFonts.secularOne(
                                    color: Colors.teal.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      homeController.search.value = searchc.text;
                    },
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.search,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
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
              Text(
                "Results",
                style: GoogleFonts.secularOne(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => StreamBuilder(
                  stream: FbHelper.fbHelper
                      .readCategoryData(homeController.search.value),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      List<SearchModal> categoryDataList = [];
                      QuerySnapshot? snapData = snapshot.data;
                      for (var x in snapData!.docs) {
                        Map? data = x.data() as Map;
                        String name = data['name'];
                        String price = data['price'];
                        String description = data['description'];
                        String offer = data['offer'];
                        String category = data['category'];
                        String? image = data['image'];
                        SearchModal searchModal = SearchModal(
                          name: name,
                          price: price,
                          category: category,
                          offer: offer,
                          description: description,
                          id: x.id,
                          image: image,
                        );
                        categoryDataList.add(searchModal);
                      }
                      return Expanded(
                        child: categoryDataList.isNotEmpty
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 240,
                                ),
                                itemCount: categoryDataList.length,
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
                                                bottomRight:
                                                    Radius.circular(10),
                                                topLeft: Radius.circular(10),
                                              ),
                                              color: Colors.red,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${categoryDataList[index].offer} %",
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
                                                  child: categoryDataList[index]
                                                              .image ==
                                                          null
                                                      ? Image.asset(
                                                          "assets/images/2.png",
                                                          height: 100,
                                                          width: 100,
                                                        )
                                                      : Image.memory(
                                                          base64Decode(
                                                            categoryDataList[
                                                                    index]
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
                                                "${categoryDataList[index].name}",
                                                style: GoogleFonts.secularOne(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "${categoryDataList[index].category}",
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
                                                "₹ ${categoryDataList[index].price}",
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
                              )
                            : Container(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    );
                  },
                ),
              ),
              Obx(
                () => StreamBuilder(
                  stream: FbHelper.fbHelper
                      .readCategoryData(homeController.search.value),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      List<SearchModal> nameDataList = [];
                      QuerySnapshot? snapData = snapshot.data;
                      for (var x in snapData!.docs) {
                        Map? data = x.data() as Map;
                        String name = data['name'];
                        String price = data['price'];
                        String description = data['description'];
                        String offer = data['offer'];
                        String category = data['category'];
                        String? image = data['image'];
                        SearchModal searchModal = SearchModal(
                          name: name,
                          price: price,
                          category: category,
                          offer: offer,
                          description: description,
                          id: x.id,
                          image: image,
                        );
                        nameDataList.add(searchModal);
                      }
                      return Expanded(
                        child: nameDataList.isNotEmpty
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 240,
                                ),
                                itemCount: nameDataList.length,
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
                                                bottomRight:
                                                    Radius.circular(10),
                                                topLeft: Radius.circular(10),
                                              ),
                                              color: Colors.red,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${nameDataList[index].offer} %",
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
                                                  child: nameDataList[index]
                                                              .image ==
                                                          null
                                                      ? Image.asset(
                                                          "assets/images/2.png",
                                                          height: 100,
                                                          width: 100,
                                                        )
                                                      : Image.memory(
                                                          base64Decode(
                                                            nameDataList[index]
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
                                                "${nameDataList[index].name}",
                                                style: GoogleFonts.secularOne(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "${nameDataList[index].category}",
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
                                                "₹ ${nameDataList[index].price}",
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
                              )
                            : Container(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
