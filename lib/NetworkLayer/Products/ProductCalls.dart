import 'package:dio/dio.dart';
import 'package:ecommerce_app/NetworkLayer/DioRequest.dart';

import '../../Models/ProductsResponse.dart';

DioRequest _dio = DioRequest();

Future<ProductsResponse> getAllProductsResponse(String _api) async {
  Response response;
  response = await _dio.GET(_api);

  ProductsResponse currProducts = ProductsResponse.fromJson(response.data);
  return currProducts;
}
