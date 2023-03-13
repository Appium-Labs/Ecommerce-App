import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Controllers/Cart/CartController.dart';
import 'package:ecommerce_app/Controllers/Cart/FavoritesController.dart';
import 'package:ecommerce_app/UI/pages/CartScreen/CartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Models/Product.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.currency(
        locale: "en-IN", symbol: "Rs. ", decimalDigits: 0);

    FavoritesController controller = Get.put(FavoritesController());
    CartController cartController = Get.put(CartController());
    CarouselController cc = CarouselController();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CarouselSlider(
                        carouselController: cc,
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: MediaQuery.of(context).size.height / 2.5,
                          viewportFraction: 0.8,
                        ),
                        items: product.photos!.map((i) {
                          print("---${product.photos!.indexOf(i)}");

                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                // decoration: BoxDecoration(color: Colors.amber),
                                child: Container(
                                  // color: Colors.red,
                                  height: 400,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(top: 40),
                                  child: Image.network(
                                    BASE_URL + "/" + i.url.toString(),
                                    fit: BoxFit.contain,
                                    // width:
                                    //     MediaQuery.of(context).size.width / 2,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 15, bottom: 0, left: 20),
                        child: Text(
                          product.company.toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w200),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          product.title.toString(),
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 8, bottom: 5, left: 20),
                        child: const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            product.description.toString(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2),
                          ),
                        ),
                      ),
                      // Spacer(),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 30),
                      //   child: Row(
                      //     children: [
                      //       const Text(
                      //         "Price:",
                      //         style: TextStyle(fontWeight: FontWeight.bold),
                      //       ),
                      //       const Spacer(),
                      //       Text(
                      //         "Rs. ${product.price}",
                      //         style: const TextStyle(
                      //             color: Color(0xff5956E9),
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.bold),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   height: 90,
                      //   margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       color: const Color(0xff5956E9)),
                      // )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total:",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                          // const Spacer(),
                          Text(
                            '${formatCurrency.format(product.price)}',
                            style: const TextStyle(
                                color: Color(0xff5956E9),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          if (cartController
                              .isProductInCart(product.sId.toString())) {
                            Get.to(CartScreen());
                          } else {
                            cartController.addToCart(product.sId.toString());
                            Get.dialog(
                              AlertDialog(
                                title: const Text(
                                  'Item Added To Cart',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                content: Image.asset("assets/gif/cart.gif"),
                                actions: [
                                  TextButton(
                                    child: const Text(
                                      "Close",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () => Get.back(),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff5956E9),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      color: const Color(0xff5956E9)
                                          .withOpacity(0.2),
                                      blurRadius: 20)
                                ]),
                            child: Text(
                              cartController
                                      .isProductInCart(product.sId.toString())
                                  ? "Go To Cart"
                                  : "Add To Cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                  margin: EdgeInsets.only(top: 50, left: 15),
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 20)
                      ]),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                )),
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 48, horizontal: 20),
                  // padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 20)
                      ]),
                  height: 50,
                  width: 50,
                  child: Obx(
                    () => IconButton(
                      icon: controller
                              .isProductInFavorites(product.sId.toString())
                          ? Image.asset(
                              "assets/png/Heart.png",
                              height: 28,
                            )
                          : SvgPicture.asset(
                              "assets/icons/Heart.svg",
                            ),
                      onPressed: () {
                        if (controller
                            .isProductInFavorites(product.sId.toString())) {
                          controller.removeFavorite(product.sId.toString());
                        } else {
                          controller.addToFavorites(product.sId.toString());
                        }
                      },
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
