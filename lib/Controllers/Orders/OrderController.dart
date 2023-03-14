import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Controllers/Cart/CartController.dart';
import 'package:ecommerce_app/Controllers/Products/ProductController.dart';
import 'package:ecommerce_app/Models/OrderHistory.dart';
import 'package:ecommerce_app/Models/OrderUserModelResponse.dart';
import 'package:ecommerce_app/Models/Product.dart';
import 'package:ecommerce_app/Models/ProductsResponse.dart';
import 'package:ecommerce_app/NetworkLayer/Products/ProductCalls.dart'
    as productCalls;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../../Models/UserModel.dart';
import '../../NetworkLayer/CartItems/CartCalls.dart';
import '../../NetworkLayer/NetworkCalls.dart';

class OrdersController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxList<OrderHistory> orderDetails = <OrderHistory>[].obs;
  RxList<Product> orders = <Product>[].obs;
  ProductController productController = ProductController();
  Rx<OrderHistory> orderModel = OrderHistory().obs;
  RxList<String> cartItemsId = <String>[].obs;
  RxList<String> ordersId = <String>[].obs;
  Rx<OrderUserResponse> orderUserResponse = OrderUserResponse().obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllProducts();
    getOrderedProducts();
  }

  void getOrderedProducts() async {
    isLoading.value = true;
    update();
    final prefs = GetStorage();
    String? token = prefs.read("token");
    UserModel user = await getAllOrderItems(
        BASE_URL + "/api/users/profile/" + token.toString());
    var temp = user.user!.orderHistory?.toList();
    orderDetails.assignAll(temp as Iterable<OrderHistory>);
    orderDetails.refresh();

    var curr = <Product>[];

    for (var i = 0; i < products.length; i++) {
      for (var j = 0; j < temp!.length; j++) {
        if (products[i].sId.toString() == temp[j].productId.toString()) {
          curr.add(products[i]);
        }
      }
    }
    print("orders-------");
    print(orders);
    orders.assignAll(curr);
    orders.refresh();
    isLoading.value = false;
    update();
  }

  void getAllProducts() async {
    ProductsResponse res = await productCalls
        .getAllProductsResponse(BASE_URL + GET_ALL_PRODUCTS_END_POINTS);
    // ProductsResponse currProducts = ProductsResponse.fromJson(res);
    var temp = res.data!.products!.toList();
    products.assignAll(temp as Iterable<Product>);
    print("prodcuts fetched-------------");
    print(products);
    products.refresh();
  }
}
