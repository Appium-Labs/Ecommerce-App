// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/Constants.dart';

class DioRequest {
  final _dio = Dio();

  DioRequest() {
    print("gfg");
    // initializeInterceptors();
  }
  // initializeInterceptors() async {
  //   print("inside interceptors");
  //   _dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) {
  //         print(options.baseUrl);
  //         return handler.next(options);
  //       },
  //       onResponse: (response, handler) {
  //         // print(response.data);
  //         return handler.next(response);
  //       },
  //       onError: (e, handler) {
  //         print(e);
  //       },
  //     ),
  //   );
  // }

  Future<Response> GET(_api) async {
    Response response;
    response = await _dio.get(_api);
    return response;
  }

  Future<Response> POST(_api, req) async {
    Response response;
    response = await _dio.post(_api, data: req);
    return response;
  }

  Future<Response> PATCH(_api, req) async {
    Response response;
    response = await _dio.patch(_api, data: req);
    return response;
  }

  Future<Response> PUT(_api, req) async {
    Response response;
    response = await _dio.put(_api, data: req);
    return response;
  }
}
