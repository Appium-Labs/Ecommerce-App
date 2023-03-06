// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/Constants.dart';

class DioRequest {
  final _dio = Dio();

  DioRequest() {
    print("gfg");
    initializeInterceptors();
  }
  initializeInterceptors() async {
    print("inside interceptors");
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print(options.method);
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print(response.data);
          return handler.next(response);
        },
        onError: (e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> GET(API) async {
    Response response;
    response = await _dio.get(API);
    return response;
  }
}
