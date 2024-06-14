import 'package:dio/dio.dart';

abstract class DioServices {
  /// To set Http headers
  setHttpHeaders({String? token, String? contentType});

  /// Set certificate
  setCertificate();

  /// method to make http GET request
  Future<dynamic> get(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? queryParameters,
  });

  /// method to make http POST request
  Future<dynamic> post(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic>? body,
  });

  /// method to make http POST form-data request
  Future<dynamic> postFormData(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? queryParameters,
    required FormData? formData,
  });

  /// method to make http PUT request
  Future<dynamic> put(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });

  /// method to make http Delete request
  Future<dynamic> delete(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? queryParameters,
  });

  /// method to make http PATCH request
  Future<dynamic> patch(
    String url, {
    String? id,
    String? token,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic>? body,
  });
}
