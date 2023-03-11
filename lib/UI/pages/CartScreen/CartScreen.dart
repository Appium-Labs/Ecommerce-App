import 'package:ecommerce_app/Controllers/Cart/CartController.dart';
import 'package:ecommerce_app/PaymentButton.dart';
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
              : Container(
                  child: Column(
                    children: [
                      Expanded(
                        // height: MediaQuery.of(context).size.height * 0.66,
                        child: ListView.builder(
                            itemCount: controller.cartItems.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                  key: Key(controller.cartItems[index].sId
                                      .toString()),
                                  onDismissed: (direction) {
                                    Get.dialog(
                                      AlertDialog(
                                        title:
                                            const Text('Remove Item From Cart'),
                                        content: const Text(
                                            'Are you sure you want to remove this item from the cart'),
                                        actions: [
                                          TextButton(
                                            child: const Text("No"),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text("Yes"),
                                            onPressed: () {
                                              controller.removeCartItem(
                                                  controller
                                                      .cartItems[index].sId
                                                      .toString());
                                              Get.back();
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: AddedProductCard(
                                      product: controller.cartItems[index]));
                            }),
                      ),
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Total: "),
                                Spacer(),
                                Text("10000")
                              ],
                            ),
                            PaymentButton(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }
}
