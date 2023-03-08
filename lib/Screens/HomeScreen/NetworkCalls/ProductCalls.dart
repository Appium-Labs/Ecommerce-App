import 'package:dio/dio.dart';
import 'package:ecommerce_app/DioRequest.dart';
import 'package:ecommerce_app/Screens/HomeScreen/Models/ProductsResponse.dart';

DioRequest _dio = DioRequest();

Future<ProductsResponse> getAllProductsResponse(String _api) async {
  Response response;
  response = await _dio.GET(_api);

  ProductsResponse currProducts = ProductsResponse.fromJson(response.data);
  // print(currProducts);
  return currProducts;
}
