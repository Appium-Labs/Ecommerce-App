import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../Models/CategoryModel.dart';

class CategoryController extends GetxController {
  List<CatergoryModel> list = [];
  var catIndex = RxString("Smartphone");

  @override
  void onInit() {
    super.onInit();
    list.add(CatergoryModel(name: "Smartphone", isSelected: true.obs));
    list.add(CatergoryModel(name: "Laptop", isSelected: false.obs));
    list.add(CatergoryModel(name: "Watches", isSelected: false.obs));
    list.add(CatergoryModel(name: "Headphones", isSelected: false.obs));
    list.add(CatergoryModel(name: "Tablets", isSelected: false.obs));
  }

  void onTapped(int index) {
    for (var i = 0; i < list.length; i++) {
      list[i].isSelected.value = false;
    }
    list[index].isSelected.value = true;
    update();
  }

  void updateIndex(String cat) {
    catIndex.value = cat;
    print(catIndex);
    update();
  }
}
