import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Models/Product.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;
  const ProductGridItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.currency(
        locale: "en-IN", symbol: "Rs. ", decimalDigits: 0);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 200,
      width: 300,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: Row(
        children: [
          Container(
            height: 170,
            width: 150,
            margin: EdgeInsets.all(20),
            child: Image.network(
              "https://ecommerce-app-backend.vercel.app/" +
                  product.photos![0].url.toString(),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.company.toString(),
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 7, top: 2),
                    child: Text(
                      product.title.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Text(
                  product.description.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(fontSize: 14),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    '${formatCurrency.format(product.price)}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5956E9)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
