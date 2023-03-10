import 'dart:convert';

import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Models/UserModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Models/Product.dart';
import '../../NetworkLayer/Favorites/FavoritesCalls.dart';

class AddToFavoritesRequest {
  String user_id;
  String product_id;

  AddToFavoritesRequest(this.user_id, this.product_id);

  Map toJson() => {'user_id': user_id, 'product_id': product_id};
}

class FavoritesController extends GetxController {
  RxList<Product> favorites = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFavorties();
  }

  void getFavorties() async {
    final prefs = GetStorage();
    String? token = prefs.read("token");
    UserModel user = await getAllFavorites(
        BASE_URL + "/api/users/profile/" + token.toString());
    var temp = user.user!.favourites?.toList();
    favorites.assignAll(temp as Iterable<Product>);
    favorites.refresh();
  }

  void addToFavorites(String productID) async {
    final prefs = GetStorage();
    String? token = prefs.read("token");
    final temp = AddToFavoritesRequest(token.toString(), productID);
    var jsonBody = jsonEncode(temp);
    print(productID);
    print(BASE_URL + "/api/users/addtofav");
    addProductToFavorites(BASE_URL + "/api/users/addtofav", jsonBody)
        .then((value) => getFavorties());
  }

  void removeFavorite(String productID) async {
    final prefs = GetStorage();
    String? token = prefs.read("token");
    final temp = AddToFavoritesRequest(token.toString(), productID);
    var jsonBody = jsonEncode(temp);
    print(productID);
    print(BASE_URL + "/api/users/addtofav");
    addProductToFavorites(BASE_URL + "/api/users/removefromfav", jsonBody)
        .then((value) => getFavorties());
  }

  bool isProductInFavorites(String productID) {
    for (var i = 0; i < favorites.length; i++) {
      if (favorites[i].sId == productID) {
        return true;
      }
    }
    return false;
  }
}
