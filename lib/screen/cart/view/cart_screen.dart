import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled_getx_fb/screen/home/modal/home_modal.dart';
import '../../../utils/fb_helper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
              Center(
                child: Text(
                  "Cart List",
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
              StreamBuilder(
                stream: FbHelper.fbHelper.readCartItem(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    List<CartModal> cartDataList = [];
                    QuerySnapshot? snapData = snapshot.data;
                    for (var x in snapData!.docs) {
                      Map? data = x.data() as Map;
                      String name = data['name'];
                      String price = data['price'];
                      String description = data['description'];
                      String offer = data['offer'];
                      String category = data['category'];
                      String? image = data['image'];
                      bool cart = data['cart'];
                      CartModal cartModal = CartModal(
                        name: name,
                        price: price,
                        category: category,
                        offer: offer,
                        description: description,
                        id: x.id,
                        image: image,
                        cart: cart,
                      );
                      cartDataList.add(cartModal);
                    }
                    return Expanded(
                      child: cartDataList.isNotEmpty
                          ? ListView.builder(
                              itemCount: cartDataList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      var name = cartDataList[index].name;
                                      var description =
                                          cartDataList[index].description;
                                      var category =
                                          cartDataList[index].category;
                                      var price = cartDataList[index].price;
                                      var offer = cartDataList[index].offer;
                                      var image = cartDataList[index].image;

                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor:
                                            const Color(0xfffef2fe),
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
                                                  child: Text(
                                                    "Item Details",
                                                    style:
                                                        GoogleFonts.secularOne(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.teal,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
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
                                                    fontSize: 18,
                                                    color: Colors.black54,
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
                                                  decoration:
                                                      const BoxDecoration(
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
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black45,
                                                            ),
                                                          ),
                                                          Text(
                                                            "₹ $price",
                                                            style: GoogleFonts
                                                                .secularOne(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 25,
                                                              color:
                                                                  Colors.black,
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
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () {},
                                                            child: Container(
                                                              height: double
                                                                  .infinity,
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  10,
                                                                ),
                                                                color:
                                                                    Colors.teal,
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "Buy now",
                                                                style: GoogleFonts
                                                                    .secularOne(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white,
                                                                ),
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
                                    onDoubleTap: () {
                                      FbHelper.fbHelper.updateCartItem(
                                        id: cartDataList[index].id,
                                        cart: false,
                                        image: cartDataList[index].image,
                                        description:
                                            cartDataList[index].description,
                                        offer: cartDataList[index].offer,
                                        category: cartDataList[index].category,
                                        price: cartDataList[index].price,
                                        name: cartDataList[index].name,
                                      );
                                    },
                                    child: Container(
                                      height: 130,
                                      width: double.infinity,
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
                                                "${cartDataList[index].offer} %",
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
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  alignment: Alignment.center,
                                                  child: cartDataList[index]
                                                              .image ==
                                                          null
                                                      ? Image.asset(
                                                          "assets/images/2.png",
                                                          height: 100,
                                                          width: 100,
                                                        )
                                                      : Image.memory(
                                                          base64Decode(
                                                            cartDataList[index]
                                                                .image
                                                                .toString(),
                                                          ),
                                                          height: 100,
                                                          width: 100,
                                                        ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${cartDataList[index].name}",
                                                          style: GoogleFonts
                                                              .secularOne(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${cartDataList[index].category}",
                                                          style: GoogleFonts
                                                              .secularOne(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black45,
                                                          ),
                                                        ),
                                                        Text(
                                                          "₹ ${cartDataList[index].price}",
                                                          style: GoogleFonts
                                                              .secularOne(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                "Cart list is empty !",
                                style: GoogleFonts.secularOne(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
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
      ),
    );
  }
}
