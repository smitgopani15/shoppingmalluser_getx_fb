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
    var category = Get.arguments;
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
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
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
                    category,
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
              StreamBuilder(
                stream: FbHelper.fbHelper.readCategoryData(category),
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
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              var name = categoryDataList[index].name;
                              var description =
                                  categoryDataList[index].description;
                              var category = categoryDataList[index].category;
                              var price = categoryDataList[index].price;
                              var offer = categoryDataList[index].offer;
                              var image = categoryDataList[index].image;
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: const Color(0xfffef2fe),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                ),
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 30,
                                      right: 30,
                                      top: 30,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Center(
                                          child: SizedBox(
                                            height: 200,
                                            width: 200,
                                            child: image == null
                                                ? Image.asset(
                                                    "assets/images/2.png",
                                                  )
                                                : Image.memory(
                                                    base64Decode(
                                                      image.toString(),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "$name",
                                          style: GoogleFonts.secularOne(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "$category",
                                          style: GoogleFonts.secularOne(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Descriptions",
                                          style: GoogleFonts.secularOne(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "$description",
                                          style: GoogleFonts.secularOne(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Offers",
                                          style: GoogleFonts.secularOne(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "$offer %",
                                          style: GoogleFonts.secularOne(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Reviews & Ratings",
                                          style: GoogleFonts.secularOne(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 22,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 22,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 22,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 22,
                                            ),
                                            const Icon(
                                              Icons.star_half,
                                              color: Colors.amber,
                                              size: 22,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 5,
                                                top: 2.5,
                                              ),
                                              child: Text(
                                                "4.5 (318 Reviews)",
                                                style: GoogleFonts.secularOne(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.black45,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 80,
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.black12,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Total Price",
                                                    style:
                                                        GoogleFonts.secularOne(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15,
                                                      color: Colors.black45,
                                                    ),
                                                  ),
                                                  Text(
                                                    "₹ $price",
                                                    style:
                                                        GoogleFonts.secularOne(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 10,
                                                  ),
                                                  child: Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10,
                                                      ),
                                                      color: Colors.teal,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Add to cart",
                                                      style: GoogleFonts
                                                          .secularOne(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
