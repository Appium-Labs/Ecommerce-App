import 'package:dio/dio.dart';
import 'package:ecommerce_app/Models/UserModel.dart';
import 'package:ecommerce_app/NetworkLayer/DioRequest.dart';

import '../Models/User.dart';

DioRequest _dio = DioRequest();

Future<Response<dynamic>> getAllProductsResponse(String _api) async {
  Response response;
  response = await _dio.GET(_api);
  return response;
}

Future<Response<dynamic>> loginUserResponse(_api, req) async {
  Response response;
  response = await _dio.POST(_api, req);
  return response;
}

Future<Response<dynamic>> signUpUserResponse(_api, req) async {
  Response response;
  response = await _dio.POST(_api, req);
  return response;
}

Future<UserModel> updateUserResponse(api, req) async {
  Response response;
  response = await _dio.POST(api, req);
  Response newResponse = await _dio.GET(api);
  print("ssss");
  print(newResponse);
  print(newResponse.data);
  UserModel userModel = UserModel.fromJson(newResponse.data);
  return userModel;
}
