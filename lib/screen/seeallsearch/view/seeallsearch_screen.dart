import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/fb_helper.dart';
import '../../home/controller/home_controller.dart';
import '../../home/modal/home_modal.dart';

class SeeallsearchScreen extends StatefulWidget {
  const SeeallsearchScreen({super.key});

  @override
  State<SeeallsearchScreen> createState() => _SeeallsearchScreenState();
}

class _SeeallsearchScreenState extends State<SeeallsearchScreen> {
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
              Center(
                child: Text(
                  "Search Here",
                  style: GoogleFonts.secularOne(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.back();
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
                        Icons.arrow_back_outlined,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
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
                          right: 5,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: searchc,
                                cursorColor: Colors.teal,
                                style: GoogleFonts.secularOne(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Search item",
                                  hintStyle: GoogleFonts.secularOne(
                                    color: Colors.teal.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  suffixIcon: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        searchc.text;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.search,
                                      color: Colors.teal,
                                    ),
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
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Get.toNamed(
                                'categorydata_screen',
                                arguments: "mobile",
                              );
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
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Get.toNamed(
                                'categorydata_screen',
                                arguments: "tv",
                              );
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
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Get.toNamed(
                                'categorydata_screen',
                                arguments: "watch",
                              );
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
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Get.toNamed(
                                'categorydata_screen',
                                arguments: "laptop",
                              );
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
              searchc.text.isNotEmpty
                  ? Text(
                      "Results",
                      style: GoogleFonts.secularOne(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    )
                  : Center(
                      child: Text(
                        "No search found !",
                        style: GoogleFonts.secularOne(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: FbHelper.fbHelper.readCategoryData(searchc.text),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    List<SearchModal> categoryDataList = [];
                    QuerySnapshot? snapData = snapshot.data;
                    categoryDataList.clear();
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
                    return categoryDataList.isNotEmpty
                        ? Expanded(
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
                                    var category =
                                        categoryDataList[index].category;
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 5,
                                                      top: 2.5,
                                                    ),
                                                    child: Text(
                                                      "4.5 (318 Reviews)",
                                                      style: GoogleFonts
                                                          .secularOne(
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Total Price",
                                                          style: GoogleFonts
                                                              .secularOne(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black45,
                                                          ),
                                                        ),
                                                        Text(
                                                          "₹ $price",
                                                          style: GoogleFonts
                                                              .secularOne(
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
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 10,
                                                        ),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              10,
                                                            ),
                                                            color: Colors.teal,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "Add to cart",
                                                            style: GoogleFonts
                                                                .secularOne(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
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
                                  ),
                                );
                              },
                            ),
                          )
                        : Container();
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.teal,
                    ),
                  );
                },
              ),
              StreamBuilder(
                stream: FbHelper.fbHelper.readNameData(searchc.text),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    List<SearchModal> nameDataList = [];
                    QuerySnapshot? snapData = snapshot.data;
                    nameDataList.clear();
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
                    return nameDataList.isNotEmpty
                        ? Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 240,
                              ),
                              itemCount: nameDataList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    var name = nameDataList[index].name;
                                    var description =
                                        nameDataList[index].description;
                                    var category = nameDataList[index].category;
                                    var price = nameDataList[index].price;
                                    var offer = nameDataList[index].offer;
                                    var image = nameDataList[index].image;
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 5,
                                                      top: 2.5,
                                                    ),
                                                    child: Text(
                                                      "4.5 (318 Reviews)",
                                                      style: GoogleFonts
                                                          .secularOne(
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Total Price",
                                                          style: GoogleFonts
                                                              .secularOne(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black45,
                                                          ),
                                                        ),
                                                        Text(
                                                          "₹ $price",
                                                          style: GoogleFonts
                                                              .secularOne(
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
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 10,
                                                        ),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              10,
                                                            ),
                                                            color: Colors.teal,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "Add to cart",
                                                            style: GoogleFonts
                                                                .secularOne(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
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
                                  ),
                                );
                              },
                            ),
                          )
                        : Container();
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
