import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Controllers/Orders/OrderController.dart';
import 'package:ecommerce_app/UI/pages/OrdersScreen/OrderCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/NoItemsScreen.dart';

class OrdersScree extends StatelessWidget {
  OrdersScree({super.key});
  OrdersController controller = Get.put(OrdersController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Orders",
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
        () => controller.orders.length == 0 || controller.isLoading.value
            ? controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                    color: primaryColor,
                  ))
                : NoItemsScreen(
                    category: "Orders",
                    imageURL: "assets/png/EmptyFav.png",
                  )
            : Center(
                child: ListView.builder(
                    itemCount: controller.orders.length,
                    itemBuilder: (context, index) {
                      print(controller.orders.length);
                      print(controller.orderDetails.length);
                      return OrderCard(
                        product: controller.orders[index],
                        order: controller.orderDetails[index],
                      );
                    }),
              ),
      ),
    );
  }
}
