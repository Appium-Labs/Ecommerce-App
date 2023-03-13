import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/NetworkLayer/DioRequest.dart';
import 'package:ecommerce_app/Models/UserModel.dart';

DioRequest _dio = DioRequest();

Future<UserModel> getAllFavorites(String _api) async {
  Response response;
  response = await _dio.GET(_api);

  UserModel res = UserModel.fromJson(response.data);
  print(res.user!.favourites!.length);
  // print(currProducts);
  // return currProducts;
  return res;
}

Future<void> addProductToFavorites(String _api, String jsonBody) async {
  print(jsonBody);

  Response response = await _dio.POST(_api, jsonBody);
  print(response.data);
  return;
}

Future<void> removeFromFavorites(String _api, String jsonBody) async {
  Response response = await _dio.POST(_api, jsonBody);
  print(response.data);
  return;
}
