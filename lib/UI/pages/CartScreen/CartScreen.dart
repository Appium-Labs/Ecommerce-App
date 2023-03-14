import 'package:ecommerce_app/Controllers/Cart/CartController.dart';
import 'package:ecommerce_app/Controllers/Profile/ProfileController.dart';
import 'package:ecommerce_app/PaymentButton.dart';
import 'package:ecommerce_app/UI/pages/CartScreen/AddedProductCard.dart';
import 'package:ecommerce_app/UI/pages/ProfileScreen/ProfileScreen.dart';
import 'package:ecommerce_app/UI/shared/NoItemsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  CartController controller = Get.put(CartController());
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.currency(
        locale: "en-IN", symbol: "Rs. ", decimalDigits: 0);
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
                        // color: Colors.yellow,
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Amount :- ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${formatCurrency.format(controller.cartAmount.value)}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            ShippingDetailsButton(),
                            profileController.user.value.shipping_address
                                            ?.isNotEmpty ==
                                        true &&
                                    profileController
                                            .user.value.name?.isNotEmpty ==
                                        true
                                ? PaymentButton(
                                    areDetailsAdded: true,
                                  )
                                : AbsorbPointer(
                                    absorbing: true,
                                    child: PaymentButton(
                                      areDetailsAdded: false,
                                    )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }
}

class ShippingDetailsButton extends StatelessWidget {
  const ShippingDetailsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProfileScreen());
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff5956E9),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  color: const Color(0xff5956E9).withOpacity(0.2),
                  blurRadius: 20)
            ]),
        child: Text(
          "Confirm Shipping Details",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
    );
  }
}
