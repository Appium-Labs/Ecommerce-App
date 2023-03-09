import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Models/UserModel.dart';
import 'package:ecommerce_app/NetworkLayer/CartItems/CartCalls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Models/Product.dart';
import '../../NetworkLayer/Favorites/FavoritesCalls.dart';

class CartController extends GetxController {
  RxList<Product> cartItems = <Product>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartItems();
  }

  void getCartItems() async {
    final prefs = GetStorage();
    String? token = prefs.read("token");
    UserModel user = await getAllCartItems(
        BASE_URL + "/api/users/profile/" + token.toString());
    var temp = user.user!.cartItems?.toList();
    cartItems.assignAll(temp as Iterable<Product>);
    cartItems.refresh();
  }
}
