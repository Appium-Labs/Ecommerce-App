
import 'dart:convert';

import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Models/User.dart';
import 'package:ecommerce_app/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import '../../NetworkLayer/DioRequest.dart';
import '../../NetworkLayer/NetworkCalls.dart';

DioRequest _dio = DioRequest();

class UserLoginRequest {
  String email;
  String password;
  UserLoginRequest(this.email, this.password);

  Map toJson() => {"email": this.email, "password": this.password};
}

class UserSignUpRequest {
  String email;
  String password;
  String name;
  UserSignUpRequest(this.email, this.password, this.name);

  Map toJson() =>
      {"email": this.email, "password": this.password, "name": this.name};
}

class LoginController extends GetxController {
  final pageState = "LOGIN".obs;
  final user = User().obs;
  final hidePassword = true.obs;
  final statusCode = 0.obs;
  RxBool isLoginButtonClicked = false.obs;

  final prefs = GetStorage();

  changePageState(currentState) {
    if (currentState == "LOGIN") {
      pageState.value = "SIGNUP";
    } else {
      pageState.value = "LOGIN";
    }
  }

  void loginUser(String email, String password) async {
    final userResponse = await loginUserResponse(BASE_URL + LOGIN_API_END_POINT,
        jsonEncode(UserLoginRequest(email, password)));
    print(userResponse.data["user_id"]);
    prefs.write("token", userResponse.data["user_id"]);
    statusCode.value = 201;
  }

  signUpUser(String email, String password, String name) async {
    final userResponse = await loginUserResponse(
        BASE_URL + SIGNUP_API_END_POINT,
        jsonEncode(UserSignUpRequest(email, password, name)));
    print(userResponse.data["user_id"]);
    prefs.write("token", userResponse.data["user_id"]);
    statusCode.value = 201;
  }

  getUser(String userId) async {
    Response response;
    response = await _dio.GET(BASE_URL + "/api/users/profile/${userId}");

    UserModel res = UserModel.fromJson(response.data);
    print(res.user!.cartItems!.length);
    // print(currProducts);
    // return currProducts;
    return res;
  }
}
