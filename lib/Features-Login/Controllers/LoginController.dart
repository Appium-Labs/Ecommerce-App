import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import '../../NetworkLayer/NetworkCalls.dart';

class LoginController extends GetxController {
  final pageState = "LOGIN".obs;
  final user = User().obs;
  final hidePassword = true.obs;
  final statusCode = 0.obs;
  bool isLoginButtonClicked = false;

  final prefs = GetStorage();

  changePageState(currentState) {
    if (currentState == "LOGIN") {
      pageState.value = "SIGNUP";
    } else {
      pageState.value = "LOGIN";
    }
  }

  loginUser() {
    final req = user.toJson();
    final loggedInUser = loginUserResponse(BASE_URL + LOGIN_API_END_POINT, req);
    loggedInUser.then((data) => {
          if (data.statusCode == 201)
            {
              statusCode.value = data.statusCode!,
              print(statusCode),
              user.value = User.fromJson(data.data["data"]["user"]),
              print(user.value.email),
            }
          else
            {
              statusCode.value = data.statusCode!,
            }
        });
  }

  signUpUser() {
    final req = user.toJson();
    final signedUpUser =
        signUpUserResponse(BASE_URL + SIGNUP_API_END_POINT, req);
    int? statusCode;
    signedUpUser.then((data) => {
          if (data.statusCode == 201)
            {
              statusCode = data.statusCode!,
              print(data.data["data"]["user"]),
              user.value = User.fromJson(data.data["data"]["user"]),
              print(user.value.email),
            }
          else
            {
              statusCode = data.statusCode!,
            }
        });
    return statusCode;
  }
}
