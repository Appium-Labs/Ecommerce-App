import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/NetworkLayer/DioRequest.dart';
import 'package:ecommerce_app/Models/UserModel.dart';

DioRequest _dio = DioRequest();

Future<UserModel> getAllCartItems(String _api) async {
  Response response;
  response = await _dio.GET(_api);

  UserModel res = UserModel.fromJson(response.data);
  print(res.user!.cartItems!.length);
  // print(currProducts);
  // return currProducts;
  return res;
}

Future<UserModel> getAllOrderItems(String _api) async {
  Response response;
  response = await _dio.GET(_api);

  UserModel res = UserModel.fromJson(response.data);
  print("printing---");
  print(res.user!.orderHistory!);
  // print(res.user!.orderHistory!.length);
  // print(currProducts);
  // return currProducts;
  return res;
}

Future<void> addProductToCart(String _api, String jsonBody) async {
  Response response = await _dio.POST(_api, jsonBody);
  print(response.data);
  return;
}

Future<void> removeFromCart(String _api, String jsonBody) async {
  Response response = await _dio.POST(_api, jsonBody);
  print(response.data);
  return;
}

Future<Response> getClientToken(String _api, String jsonBody) async {
  Response response = await _dio.POST(_api, jsonBody);
  // print("in api call");
  // print(response.data["client_secret"]);
  return response;
}

Future<void> createOrder(String _api, String jsonBody) async {
  print("third");
  print(jsonBody);
  Response response = await _dio.POST(_api, jsonBody);
  print(response.data);
  return;
}
