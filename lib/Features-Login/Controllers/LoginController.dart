import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final pageState = "LOGIN".obs;

  changePageState(currentState) {
    if (currentState == "LOGIN") {
      pageState.value = "SIGNUP";
    } else {
      pageState.value = "LOGIN";
    }
  }
}
