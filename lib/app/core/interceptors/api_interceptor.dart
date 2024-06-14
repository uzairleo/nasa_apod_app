import 'package:dio/dio.dart';
import 'package:nasa_apod_app/app/core/httpClient/api_response_handler.dart';

class ApiInterceptor extends Interceptor {
  final ApiResponseHandlerServices apiResponseHandler;

  ApiInterceptor(this.apiResponseHandler);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    apiResponseHandler.processResponse(response);
    return handler.next(response);
  }
}
