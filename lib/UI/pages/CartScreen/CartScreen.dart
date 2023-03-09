import 'package:ecommerce_app/Controllers/Cart/CartController.dart';
import 'package:ecommerce_app/UI/pages/CartScreen/AddedProductCard.dart';
import 'package:ecommerce_app/UI/shared/NoItemsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Cart",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              color: Colors.black,
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Obx(
          () => controller.cartItems.length == 0
              ? NoItemsScreen(
                  category: "Cart Items", imageURL: "assets/png/EmptyFav.png")
              : Center(
                  child: ListView.builder(
                      itemCount: controller.cartItems.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            key:
                                Key(controller.cartItems[index].sId.toString()),
                            onDismissed: (direction) {},
                            child: AddedProductCard(
                                product: controller.cartItems[index]));
                      }),
                ),
        ));
  }
}
