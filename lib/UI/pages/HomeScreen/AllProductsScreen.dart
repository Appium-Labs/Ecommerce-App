import "package:ecommerce_app/Controllers/Products/ProductController.dart";
import 'package:ecommerce_app/UI/pages/HomeScreen/ProductGridItem.dart';
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";

import '../DetailsScreen/DetailsScreen.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());

    return Scaffold(
        appBar: AppBar(
          // title: Container(
          //   width: MediaQuery.of(context).size.width / 1.5,
          //   child: TextField(
          //     decoration: InputDecoration(
          //         prefixIconConstraints: BoxConstraints(maxHeight: 30),
          //         prefixIcon: Container(
          //             margin: EdgeInsets.only(left: 15),
          //             child: SvgPicture.asset("assets/icons/Search.svg")),
          //         contentPadding: const EdgeInsets.all(18),
          //         label: Container(
          //           margin: const EdgeInsets.only(left: 8.0, top: 1),
          //           child: const Text(
          //             "Search",
          //             style: TextStyle(fontSize: 15),
          //           ),
          //         ),
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(30),
          //             borderSide:
          //                 const BorderSide(width: 2, color: Colors.black))),
          //   ),
          // ),
          centerTitle: true,
          title: Text(
            "All Products",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        // appBar: AppBar(title: Text("All Products")),
        body: Center(
            child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(
                            DetailsScreen(product: controller.products[index]));
                      },
                      child:
                          ProductGridItem(product: controller.products[index]));
                })));
  }
}
