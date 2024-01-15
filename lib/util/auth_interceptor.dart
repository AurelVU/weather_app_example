import 'package:dio/dio.dart';

import '../constants.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      "key": apiKey,
    });
    handler.next(options);
  }
}