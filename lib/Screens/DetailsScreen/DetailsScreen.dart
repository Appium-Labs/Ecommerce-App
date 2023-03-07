import 'package:ecommerce_app/Screens/HomeScreen/Models/Product.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 1,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.amber,
                height: 380,
              ),
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 5, left: 20),
                child: Text(
                  product.company.toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  product.title.toString(),
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 5, left: 20),
                child: const Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Text(
                  // product.description.toString(),
                  "er erh wet hwt eh et h wer h st jhrtgjrtgj rt wet hwt eh et h wer h st jhrtgjrtgj rt j ery jerhergth ert hwetr hweyr hyrwt h wrt  wrt h wtehyewr hywrt w et h wet h wethywr yh wer",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2),
                ),
              ),
              // Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  children: [
                    Text("Price:"),
                    Spacer(),
                    Text("Rs. " + product.price.toString())
                  ],
                ),
              ),

              Container(
                height: 90,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.purple),
              )
            ],
          ),
        ),
      ),
    );
  }
}
