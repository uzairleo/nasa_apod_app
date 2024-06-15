// ignore_for_file: unnecessary_nullable_for_final_variable_declarations, prefer_const_declarations

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_apod_app/app/core/Exception/exception.dart';
import 'package:nasa_apod_app/app/core/httpClient/api_response_handler.dart';
import 'package:nasa_apod_app/app/core/interceptors/api_interceptor.dart';
import 'package:nasa_apod_app/app/core/interceptors/log_interceptor.dart';
import 'package:nasa_apod_app/app/core/utilities/authenticator.dart';

import 'dio_service.dart';

class DioClient implements DioServices {
  final String httpErrorMessage = "Http error";
  Dio? dio;
  ApiResponseHandlerServices? apiResponseHandler;
  final bool _isSslEnabled = false;
  Authenticator? authenticator;

  DioClient({this.dio, this.apiResponseHandler, this.authenticator}) {
    if (kReleaseMode) {
      dio!.interceptors.add(ApiInterceptor(ApiResponseHandler()));
    } else {
      dio!.interceptors.add(CustomLogInterceptor(ApiResponseHandler()));
    }
    dio!.options.receiveTimeout = const Duration(milliseconds: 15000);
    if (!kIsWeb) {
      dio!.options.connectTimeout = const Duration(
          milliseconds: 15000); // issue in latest dio version 5.0.0
    }
  }

  @override
  setHttpHeaders({String? token, String? contentType}) {
    Map<String, String> headers = {};
    headers[HttpHeaders.contentTypeHeader] = contentType!;
    return headers;
  }

  @override
  setCertificate() {
    if (_isSslEnabled) {
      (dio!.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        SecurityContext sc = SecurityContext();
        //file is the path of certificate
        sc.setTrustedCertificates("file");
        HttpClient httpClient = HttpClient(context: sc);
        return httpClient;
      };
    } else {
      // Temporary For development purpose allow bad certificates
      if (!kIsWeb) {
        (dio!.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
          final sc = SecurityContext();
          HttpClient client = HttpClient(context: sc);

          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }
    }
  }

  @override
  get(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    String uriWithId = '$url${id == null ? '' : '/$id'}';
    String query = _buildQuery(queryParameters);
    String uri = "$uriWithId${query.isNotEmpty ? '?$query' : ''}";

    setCertificate();
    try {
      Response response = await dio!.get(
        uri,
        options: Options(
          headers:
              setHttpHeaders(token: token, contentType: "application/json"),
        ),
      );
      MappedResponse? processed = apiResponseHandler!.processResponse(response);
      return _returnResponse(processed);
    } on DioException catch (e) {
      throw ServerException(e.response!.statusCode.toString(),
          [e.response!.statusMessage ?? httpErrorMessage]);
    }
  }

  @override
  post(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    String uriWithId = '$url${id == null ? '' : '/$id'}';
    String query = _buildQuery(queryParameters);
    String uri = "$uriWithId${query.isNotEmpty ? '?$query' : ''}";
    try {
      Response response = await dio!.post(
        uri,
        data: body,
        options: Options(
          headers:
              setHttpHeaders(token: token, contentType: "application/json"),
        ),
      );

      MappedResponse? processed = apiResponseHandler!.processResponse(response);
      return _returnResponse(processed);
    } on DioException catch (e) {
      throw ServerException(e.response!.statusCode.toString(),
          [e.response!.statusMessage ?? httpErrorMessage]);
    }
  }

  @override
  Future postFormData(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? queryParameters,
    required FormData? formData,
  }) async {
    String uriWithId = '$url${id == null ? '' : '/$id'}';
    String query = _buildQuery(queryParameters);
    String uri = "$uriWithId${query.isNotEmpty ? '?$query' : ''}";
    try {
      Response response = await dio!.post(
        uri,
        data: formData,
        options: Options(
          headers: setHttpHeaders(
              token: token, contentType: Headers.multipartFormDataContentType),
        ),
      );
      MappedResponse? processed = apiResponseHandler!.processResponse(response);
      return _returnResponse(processed);
    } on DioException catch (e) {
      throw ServerException(e.response!.statusCode.toString(),
          [e.response!.statusMessage ?? httpErrorMessage]);
    }
  }

  @override
  put(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    String uriWithId = '$url${id == null ? '' : '/$id'}';
    String query = _buildQuery(queryParameters);
    String uri = "$uriWithId${query.isNotEmpty ? '?$query' : ''}";
    try {
      Response response = await dio!.put(
        uri,
        data: body,
        options: Options(
          headers:
              setHttpHeaders(token: token, contentType: "application/json"),
        ),
      );
      MappedResponse? processed = apiResponseHandler!.processResponse(response);
      return _returnResponse(processed);
    } on DioException catch (e) {
      throw ServerException(e.response!.statusCode.toString(),
          [e.response!.statusMessage ?? httpErrorMessage]);
    }
  }

  @override
  delete(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    String uriWithId = '$url${id == null ? '' : '/$id'}';
    String query = _buildQuery(queryParameters);
    String uri = "$uriWithId${query.isNotEmpty ? '?$query' : ''}";
    try {
      Response response = await dio!.delete(
        uri,
        options: Options(
          headers:
              setHttpHeaders(token: token, contentType: "application/json"),
        ),
      );
      MappedResponse? processed = apiResponseHandler!.processResponse(response);
      return _returnResponse(processed);
    } on DioException catch (e) {
      throw ServerException(e.response!.statusCode.toString(),
          [e.response!.statusMessage ?? httpErrorMessage]);
    }
  }

  String _buildQuery(Map<String, dynamic>? queryParameters) {
    String query = '';
    queryParameters?.forEach((key, value) => query += '$key=$value&');

    return query.isNotEmpty ? query.substring(0, query.length - 1) : query;
  }

  dynamic _returnResponse(MappedResponse? processed) {
    if (processed!.success!) {
      return processed.content;
    } else {
      throw DioExceptionType.badResponse;
    }
  }

  @override
  Future patch(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic>? body,
  }) async {
    String uriWithId = '$url${id == null ? '' : '/$id'}';
    String query = _buildQuery(queryParameters);
    String uri = "$uriWithId${query.isNotEmpty ? '?$query' : ''}";
    try {
      Response response = await dio!.patch(
        uri,
        data: body,
        options: Options(
          headers:
              setHttpHeaders(token: token, contentType: "application/json"),
        ),
      );
      MappedResponse? processed = apiResponseHandler!.processResponse(response);
      return _returnResponse(processed);
    } on DioException catch (e) {
      throw ServerException(e.response!.statusCode.toString(),
          [e.response!.statusMessage ?? httpErrorMessage]);
    }
  }
}
