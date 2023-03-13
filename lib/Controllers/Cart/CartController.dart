import 'dart:convert';
import 'dart:ffi';

import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Controllers/Orders/OrderController.dart';
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

class GetClientSecretRequest {
  int ammount;
  GetClientSecretRequest(this.ammount);
  Map toJson() => {'ammount': this.ammount};
}

class OrderRequest {
  String user_id;
  String product_id;
  bool delivery_status;
  String shipping_address;
  int phone;
  String date_of_purchase;
  OrderRequest(
      {required this.user_id,
      required this.product_id,
      required this.delivery_status,
      required this.shipping_address,
      required this.phone,
      required this.date_of_purchase});

  Map toJson() => {
        "user_id": this.user_id,
        "product_id": this.product_id,
        "delivery_status": false,
        "shipping_address": this.shipping_address,
        "phone": 12345,
        "date_of_purchase": this.date_of_purchase
      };
}

class CartController extends GetxController {
  RxList<Product> cartItems = <Product>[].obs;
  OrdersController ordersController = OrdersController();
  RxBool isLoading = false.obs;
  RxInt cartAmount = 0.obs;
  var clientSecret = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartItems();
    getCartAmount();
  }

  void getCartItems() async {
    print("-------**********************----------------");
    final prefs = GetStorage();
    String? token = prefs.read("token");
    print(token);
    UserModel user = await getAllCartItems(
        BASE_URL + "/api/users/profile/" + token.toString());
    var temp = user.user!.cartItems?.toList();
    cartItems.assignAll(temp as Iterable<Product>);
    cartItems.refresh();
    getCartAmount();
  }

  void addToCart(String productID) async {
    isLoading.value = true;
    final prefs = GetStorage();
    String? token = prefs.read("token");
    final temp = AddToCartRequest(token.toString(), productID);
    var jsonBody = jsonEncode(temp);
    print(productID);
    print(BASE_URL + "/api/users/addtocart");
    addProductToFavorites(BASE_URL + "/api/users/addtocart", jsonBody)
        .then((value) {
      isLoading.value = false;
      getCartItems();
    });
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

  void removeAllCartItems(String address) async {
    for (var i = 0; i < cartItems.length; i++) {
      makeOrder(
        cartItems[i].sId.toString(),
        address,
      );
      ordersController.cartItemsId.add(cartItems[i].sId!.toString());
      removeCartItem(cartItems[i].sId!);
    }
    cartItems.refresh();
  }

  bool isProductInCart(String productID) {
    for (var i = 0; i < cartItems.length; i++) {
      // cartAmount.value += cartItems[i].price!;
      if (cartItems[i].sId == productID) {
        return true;
      }
    }
    return false;
  }

  void getCartAmount() {
    print("+++++++++++++++++++++++");
    cartAmount.value = 0;
    for (var i = 0; i < cartItems.length; i++) {
      cartAmount.value += cartItems[i].price!;
    }
  }

  void getClientSecret(int ammount) async {
    var json = GetClientSecretRequest(ammount);
    var jsonBody = jsonEncode(json);
    try {
      var response =
          await getClientToken(BASE_URL + "/api/users/makepayment", jsonBody);

      clientSecret.value = response.data["client_secret"].toString();
    } catch (err) {
      print(err);
    }
    print(clientSecret.value);
  }

  void makeOrder(String productId, String address) async {
    final prefs = GetStorage();
    var token = prefs.read("token");
    var temp = OrderRequest(
        user_id: token.toString(),
        product_id: productId,
        delivery_status: false,
        shipping_address: address,
        phone: 12344,
        date_of_purchase: DateTime.now().toString());

    var jsonBody = jsonEncode(temp);
    print("first");
    await createOrder(BASE_URL + "/api/orders", jsonBody);
    print("second");
  }
}
