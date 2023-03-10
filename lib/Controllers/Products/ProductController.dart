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
    products.refresh();
  }
}