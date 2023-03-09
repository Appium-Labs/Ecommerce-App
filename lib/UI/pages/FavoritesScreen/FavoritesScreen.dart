import 'package:ecommerce_app/Controllers/Cart/FavoritesController.dart';
import 'package:ecommerce_app/UI/pages/FavoritesScreen/FavoritesCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/NoItemsScreen.dart';

class FavorittesScreen extends StatelessWidget {
  FavorittesScreen({super.key});
  FavoritesController favController = Get.put(FavoritesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Favorites",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              color: Colors.black,
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Obx(
          () => favController.favorites.length == 0
              ? NoItemsScreen(
                  category: "Favorite Items",
                  imageURL: "assets/png/EmptyFav.png",
                )
              : Center(
                  child: ListView.builder(
                      itemCount: favController.favorites.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            key: Key(
                                favController.favorites[index].sId.toString()),
                            onDismissed: (direction) {
                              favController.removeFavorite(favController
                                  .favorites[index].sId
                                  .toString());
                            },
                            child: FavoritesCard(
                                product: favController.favorites[index]));
                      }),
                ),
        ));
  }
}
