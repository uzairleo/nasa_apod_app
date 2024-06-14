import 'dart:convert';
import 'package:dio/dio.dart';

abstract class ApiResponseHandlerServices {
  MappedResponse? processResponse(Response? response);
  String? extractErrorMessage(dynamic body);
  String? extractErrorCode(dynamic body);
}

class ApiResponseHandler implements ApiResponseHandlerServices {
  @override
  MappedResponse? processResponse(Response? response) {
    if (response!.statusCode! >= 500) {
      if (response.data != (null)) {
        //  var msg = extractErrorMessage(json.decode(response.data));

        throw DioExceptionType.badResponse;
      } else {
        throw DioExceptionType.badResponse;
      }
    } else if (response.statusCode == 204 || response.statusCode == 201) {
      Map<String, dynamic> content = {};
      content['queueImageLocation'] =
          response.headers.value("location"); // for create-queue usecase
      return MappedResponse<dynamic>(
          code: response.statusCode,
          success: true,
          message: 'SUCCESS',
          content: content);
    } else if (response.statusCode == 401) {
      throw DioExceptionType.badResponse;
    }
    if (!((response.statusCode! < 200) ||
        (response.statusCode! >= 300) ||
        (response.data == (null)))) {
      var body = response.data != (null) && response.data.isNotEmpty
          ? response.data
          : response.statusMessage;
      return MappedResponse<dynamic>(
          code: response.statusCode,
          success: true,
          message: "SUCCESS",
          content: body);
    } else {
      var body = json.decode(response.data);
      var message = extractErrorMessage(body);
      var errorCode = extractErrorCode(body);

      return MappedResponse<dynamic>(
          code: response.statusCode,
          success: false,
          message: message,
          content: body,
          errorCode: errorCode);
    }
  }

  @override
  String? extractErrorCode(dynamic body) {
    String? errorCode = '';
    if (body['response'] != null) {
      if (body['response']['code'] != null) {
        errorCode = body['response']['code'].toString();
      }
    } else if (body['responseCode'] != null) {
      errorCode = body['responseCode'];
    }

    return errorCode;
  }

  @override
  String? extractErrorMessage(body) {
    String? errorMessage = "Failed to process request";
    if (body['msg'] != null) {
      errorMessage = body['msg'];
    } else if (body['errors'] != null) {
      var keys = body['errors'].keys.toList();
      List? values = body['errors'].values.toList();
      if (body["title"].toString().isNotEmpty) {
        if (values!.isNotEmpty) errorMessage = values[0].first.toString();
      } else {
        errorMessage = '${keys[0]}: ${body["title"]}';
      }
    } else if (body['response'] != null) {
      if (body['response']['Message'] != null) {
        errorMessage = body['response']['Message'];
      } else if (body['response']['message'] != null) {
        errorMessage = body['response']['message'];
      }
    } else if (body['errorMessage'] != null) {
      errorMessage = body['errorMessage'];
    } else if (body['error_description'] != null) {
      errorMessage = body['error_description'];
    } else if (body['message'] != null) {
      errorMessage = body['message'];
    } else if (body['Message'] != null) {
      errorMessage = body['Message'];
    } else if (body['errorCategory'] != null) {
      errorMessage = body['errorCategory'];
    } else if (body['errorDescription'] != null) {
      errorMessage = body['errorDescription'];
    } else if (body['error'] != null) {
      errorMessage = body['error'];
    } else if (body['responseDesc'] != null) {
      errorMessage = body['responseDesc'];
    }
    return errorMessage;
  }
}

class MappedResponse<T> {
  int? code;
  bool? success;
  dynamic content;
  String? message;
  String? errorCode;

  MappedResponse(
      {this.code,
      this.content,
      this.message,
      this.success,
      this.errorCode = ''});
}
