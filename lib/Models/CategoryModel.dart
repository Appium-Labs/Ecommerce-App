import 'package:get/get.dart';

class CatergoryModel {
  final String name;
  var isSelected = false.obs;
  CatergoryModel({required this.name, required this.isSelected});
}
