import 'package:ecommerce_app/Controllers/Cart/CartController.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Models/Product.dart';
import '../DetailsScreen/DetailsScreen.dart';

class AddedProductCard extends StatelessWidget {
  final Product product;
  const AddedProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.currency(
        locale: "en-IN", symbol: "Rs. ", decimalDigits: 0);

    CartController controller = Get.put(CartController());
    return GestureDetector(
      onTap: () {
        Get.to(DetailsScreen(product: product));
      },
      child: Container(
        // color: Colors.red,
        height: 150,
        padding: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2),
                  color: Colors.grey.withOpacity(0.6),
                  blurRadius: 10)
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 110,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              // color: Colors.red,
              child: Image.network(
                "https://ecommerce-app-backend.vercel.app" +
                    product.photos![0].url.toString(),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 35, bottom: 5, left: 0, right: 10),
                    child: Text(
                      product.company.toString() +
                          " " +
                          product.title.toString(),
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 0, bottom: 5, left: 0, right: 10),
                    child: Text(
                      "Price:  " + '${formatCurrency.format(product.price)}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xff5956E9),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Text(
                      "QTY:  1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('Remove Item From Cart'),
                          content: const Text(
                              'Are you sure you want to remove this item from the cart'),
                          actions: [
                            TextButton(
                              child: const Text("No"),
                              onPressed: () => Get.back(),
                            ),
                            TextButton(
                              child: const Text("Yes"),
                              onPressed: () {
                                controller
                                    .removeCartItem(product.sId.toString());
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    // padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 2, bottom: 15),
                          child: Text(
                            "Remove from cart",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
