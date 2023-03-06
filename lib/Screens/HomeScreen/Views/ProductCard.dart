import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 10,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      height: 250,
      width: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  "https://ecommerce-app-backend.vercel.app/images/image-1677930334934.jpg",
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
                      "iPhone 14 Pro",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    child: Text(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      "Really cool smartphone rwetj ewthw",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ])),
          ),
        ],
      ),
    );
  }
}
