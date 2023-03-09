import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Models/Product.dart';
import '../../NetworkLayer/Favorites/FavoritesCalls.dart';

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
}
