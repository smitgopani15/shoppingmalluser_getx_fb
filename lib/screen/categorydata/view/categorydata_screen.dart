import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/fb_helper.dart';
import '../../home/controller/home_controller.dart';
import '../../home/modal/home_modal.dart';

class CategorydataScreen extends StatefulWidget {
  const CategorydataScreen({super.key});

  @override
  State<CategorydataScreen> createState() => _CategorydataScreenState();
}

class _CategorydataScreenState extends State<CategorydataScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );

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
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.teal,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    homeController.category.value,
                    style: GoogleFonts.secularOne(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => StreamBuilder(
                  stream: FbHelper.fbHelper
                      .readCategoryData(homeController.category.value),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      List<CategoryModal> categoryDataList = [];
                      QuerySnapshot? snapData = snapshot.data;
                      for (var x in snapData!.docs) {
                        Map? data = x.data() as Map;
                        String name = data['name'];
                        String price = data['price'];
                        String description = data['description'];
                        String offer = data['offer'];
                        String category = data['category'];
                        String? image = data['image'];
                        CategoryModal categoryModal = CategoryModal(
                          name: name,
                          price: price,
                          category: category,
                          offer: offer,
                          description: description,
                          id: x.id,
                          image: image,
                        );
                        categoryDataList.add(categoryModal);
                      }
                      return Expanded(
                        child: GridView.builder(
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
                                          bottomRight: Radius.circular(10),
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
                                                      categoryDataList[index]
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
