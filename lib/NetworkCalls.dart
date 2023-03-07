import 'package:dio/dio.dart';
import 'package:ecommerce_app/DioRequest.dart';

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
