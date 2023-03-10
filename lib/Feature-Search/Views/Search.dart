// import 'dart:html';

import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/UI/pages/DetailsScreen/DetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controllers/Products/ProductController.dart';
import '../../Models/Product.dart';

class Search extends SearchDelegate<String> {
  ProductController productController = Get.put(ProductController());
  List<Product>? allProducts;
  Product? clickedProduct;
  Search() {
    print("all products");
    allProducts = productController.products.value;
    print(allProducts![0]);
  }
  @override
  String get searchFieldLabel => 'Search eg. Mac mini , Apple ';

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   return ThemeData(colorScheme: Colors.red);
  // }
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(
        // iconTheme: IconThemeData(),
        // backgroundColor: Colors.yellow,
        // backgroundColor: Colors.teal,
        color: Color(0xff0ff0ffF2F2F2), // affects AppBar's background color
        // affects the initial 'Search' text
      ),
      inputDecorationTheme: InputDecorationTheme(),
      // inputDecorationTheme: theme.inputDecorationTheme.copyWith(
      //   prefixIconColor: Colors.red,
      //   contentPadding: const EdgeInsets.all(18),
      //   border: OutlineInputBorder(
      //       gapPadding: 50,
      //       borderRadius: BorderRadius.circular(30),
      //       borderSide: const BorderSide(width: 2, color: Colors.black)),
      //   focusedBorder: OutlineInputBorder(
      //       gapPadding: 20,
      //       borderRadius: BorderRadius.circular(30),
      //       borderSide: const BorderSide(width: 2, color: Colors.black)),
      // ),
      scaffoldBackgroundColor: Color(0xff0ffF2F2F2),
    );
  }

  @override
  TextStyle searchFieldStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear)),
    ];
    // throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          print("fgfg");
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back)); // throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return DetailsScreen(product: clickedProduct!);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (!query.isEmpty) {
      final searchList = allProducts!.where((element) {
        String queryLower = query.toLowerCase();
        String categoryLower = element.category!.toLowerCase();
        String companyLower = element.company!.toLowerCase();
        String titleLower = element.title!.toLowerCase();
        return categoryLower.startsWith(queryLower) ||
            companyLower.startsWith(queryLower) ||
            titleLower.startsWith(queryLower);
      }).toList();
      if (searchList.length == 0) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Item not found",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 19,
                ),
                Text(
                  "Try a more generic search term or try looking for alternative products.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                )
              ]),
        );
      } else {
        return SingleChildScrollView(
          child: Container(
              color: Color(0xffF2F2F2),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: ((searchList!.length) / 2).round(),
                      itemBuilder: (ctx, idx) {
                        idx = 2 * idx;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SearchedProductCard(searchList![idx], context),
                            if (idx + 1 < searchList.length) ...[
                              SearchedProductCard(
                                  searchList![idx + 1], context),
                            ]
                          ],
                        );
                      }),
                ],
              )),
        );
      }
    } else {
      return Container();
    }
  }

  Widget SearchedProductCard(Product product, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 50,
      ),
      color: Color(0xffF2F2F2),
      child: GestureDetector(
        onTap: () {
          query = product.title!;
          clickedProduct = product;
          showResults(context);
        },
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              // margin: EdgeInsets.only(top: margin!),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width / 2.5,
            ),
            Positioned(
              top: -50,
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 3.2,
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F7),
                  image: DecorationImage(
                    image: NetworkImage(
                        BASE_URL + product!.photos![0].url.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 72,
                child: Text(
                  product!.company!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
            Positioned(
                bottom: 52,
                child: Text(
                  product!.title!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
            Positioned(
                bottom: 20,
                child: Text(
                  "From Rs:${product!.price!}",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                )),
            // Text("from #567"),
          ],
        ),
      ),
    );
  }
}
