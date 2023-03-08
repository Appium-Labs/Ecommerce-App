import 'package:ecommerce_app/Screens/CartScreen/AddedProductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HomeScreen/Controller/ProductController.dart';

class FavorittesScreen extends StatelessWidget {
  FavorittesScreen({super.key});
  ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Favorites",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: ListView(children: [
        AddedProductCard(
          product: controller.products[0],
        ),
        AddedProductCard(
          product: controller.products[0],
        ),
        AddedProductCard(
          product: controller.products[0],
        ),
        AddedProductCard(
          product: controller.products[0],
        ),
        AddedProductCard(
          product: controller.products[0],
        )
      ]),
    );
  }
}
