import 'dart:convert';

import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Models/UserModel.dart';
import 'package:ecommerce_app/NetworkLayer/CartItems/CartCalls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Models/Product.dart';
import '../../NetworkLayer/Favorites/FavoritesCalls.dart';

class AddToCartRequest {
  String user_id;
  String product_id;

  AddToCartRequest(this.user_id, this.product_id);

  Map toJson() => {'user_id': user_id, 'product_id': product_id};
}

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

  void addToCart(String productID) async {
    final prefs = GetStorage();
    String? token = prefs.read("token");
    final temp = AddToCartRequest(token.toString(), productID);
    var jsonBody = jsonEncode(temp);
    print(productID);
    print(BASE_URL + "/api/users/addtocart");
    addProductToFavorites(BASE_URL + "/api/users/addtocart", jsonBody)
        .then((value) => getCartItems());
  }

  void removeCartItem(String productID) async {
    final prefs = GetStorage();
    String? token = prefs.read("token");
    final temp = AddToCartRequest(token.toString(), productID);
    var jsonBody = jsonEncode(temp);
    print(productID);
    print(BASE_URL + "/api/users/addtocart");
    addProductToFavorites(BASE_URL + "/api/users/removefromcart", jsonBody)
        .then((value) => getCartItems());
  }

  bool isProductInCart(String productID) {
    for (var i = 0; i < cartItems.length; i++) {
      if (cartItems[i].sId == productID) {
        return true;
      }
    }
    return false;
  }
}
