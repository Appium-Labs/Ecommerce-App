import 'dart:convert';

import 'package:ecommerce_app/Constants.dart';

import 'package:ecommerce_app/NetworkLayer/Products/ProductCalls.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../Models/Product.dart';
import '../../../Models/ProductsResponse.dart';

class ProductController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxList<Product> fliteredProducts = <Product>[].obs;
  var firstTimeDone = false.obs;
  var isSearching = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }

  void getAllProducts() async {
    ProductsResponse res =
        await getAllProductsResponse(BASE_URL + GET_ALL_PRODUCTS_END_POINTS);
    // ProductsResponse currProducts = ProductsResponse.fromJson(res);
    var temp = res.data!.products!.toList();
    products.assignAll(temp as Iterable<Product>);
    print("prodcuts fetched-------------");
    print(products);
    firstTimeDone.value = true;
    update();
    products.refresh();
  }

  void searchProducts(String query) {
    List<Product> temp = [];
    isSearching.value = true;
    update();
    if (query.isEmpty || query == "") {
      isSearching.value = false;
      update();
      fliteredProducts.assignAll(products);
    } else {
      for (var i = 0; i < products.length; i++) {
        if (products[i]
                .company
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            products[i]
                .category
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            products[i]
                .title
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase())) {
          temp.add(products[i]);
        }
      }
      fliteredProducts.assignAll(temp as Iterable<Product>);
    }
  }
}
