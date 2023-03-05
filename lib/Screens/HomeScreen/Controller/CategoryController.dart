import 'package:ecommerce_app/Screens/HomeScreen/Models/CategoryModel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  List<CatergoryModel> list = [];

  @override
  void onInit() {
    super.onInit();
    list.add(CatergoryModel(name: "Smart Phone", isSelected: true.obs));
    list.add(CatergoryModel(name: "Laptops", isSelected: false.obs));
    list.add(CatergoryModel(name: "Watches", isSelected: false.obs));
    list.add(CatergoryModel(name: "Headphones", isSelected: false.obs));
    list.add(CatergoryModel(name: "Tablets", isSelected: false.obs));
  }

  void onTapped(int index) {
    for (var i = 0; i < list.length; i++) {
      list[i].isSelected = false.obs;
    }
    list[index].isSelected = true.obs;
    update();
  }
}
