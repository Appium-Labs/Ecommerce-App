import 'package:ecommerce_app/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Models/Product.dart';
import '../DetailsScreen/DetailsScreen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.currency(
        locale: "en-IN", symbol: "Rs. ", decimalDigits: 0);
    return GestureDetector(
      onTap: () => Get.to(DetailsScreen(
        product: product,
      )),
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: 160,
                width: 220,
                margin: EdgeInsets.only(top: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    "https://ecommerce-app-backend.vercel.app/" +
                        product.photos![0].url.toString(),
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.amber,
                        alignment: Alignment.center,
                        child: const Text(
                          'Whoops!',
                          style: TextStyle(fontSize: 30),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              // left: 62,
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(children: [
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        product.company.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        product.title.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      child: Text(
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        "${formatCurrency.format(product.price)}",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
