import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Features-Login/Model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../NetworkCalls.dart';

class LoginController extends GetxController {
  final pageState = "LOGIN".obs;
  final user = User().obs;
  final hidePassword = true.obs;

  changePageState(currentState) {
    if (currentState == "LOGIN") {
      pageState.value = "SIGNUP";
    } else {
      pageState.value = "LOGIN";
    }
  }

  loginUser() {
    final req = user.toJson();
    Future<Response> loggedInUser =
        loginUserResponse(BASE_URL + LOGIN_API_END_POINT, req);
    print(loggedInUser);
    print("login succesfully");
  }

  signUpUser() {
    print(user.value.email);
    print(user.value.password);
    print(user.value.name);
    final req = user.toJson();
    Future<Response> signedUpUser =
        signUpUserResponse(BASE_URL + SIGNUP_API_END_POINT, req);
    print(signedUpUser);
    print("signed up succesfully");
  }
}
