import 'package:flutter/material.dart';

class NoItemsScreen extends StatelessWidget {
  final String category;
  final String imageURL;
  const NoItemsScreen(
      {super.key, required this.category, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 40),
            height: 300,
            width: 400,
            child: Image(image: AssetImage(imageURL)),
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(top: 10, bottom: 5),
            child: Text(
              "No ${category} Yet",
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2),
            ),
          ),
          Text(
            "Keep on shopping.....",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
          )
        ],
      ),
    );
  }
}
