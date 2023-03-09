import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Models/Product.dart';
import '../DetailsScreen/DetailsScreen.dart';

class FavoritesCard extends StatelessWidget {
  final Product product;
  const FavoritesCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.currency(
        locale: "en-IN", symbol: "Rs. ", decimalDigits: 0);
    return GestureDetector(
      onTap: () {
        Get.to(DetailsScreen(product: product));
      },
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(right: 15),
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
                        top: 30, bottom: 5, left: 0, right: 10),
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
                  // Spacer(),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.only(bottom: 20, top: 10),
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2),
                        ),
                      ),
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
