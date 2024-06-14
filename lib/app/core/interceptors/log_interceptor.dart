import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nasa_apod_app/app/core/httpClient/api_response_handler.dart';

class CustomLogInterceptor extends Interceptor {
  final ApiResponseHandlerServices apiResponseHandler;

  CustomLogInterceptor(this.apiResponseHandler);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(err.message.toString());
    log(err.type.toString());
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(options.uri.toString());
    log(options.headers.toString());
    log(options.data.toString());
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(response.statusCode.toString());
    log(response.toString());
    // apiResponseHandler.processResponse(response);
    return handler.next(response);
  }
}
