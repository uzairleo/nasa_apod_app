import 'dart:io';

class HttpCustomException implements IOException {
  int? code;
  String? message;
  String? apiCode;

  HttpCustomException({this.code, this.message, this.apiCode = ''});

  @override
  String toString() {
    var b = StringBuffer()..write(message);
    return b.toString();
  }
}

class BadRequestException extends HttpException {
  BadRequestException({String message = 'The request is invalid.'})
      : super(message);

  @override
  String toString() {
    var b = StringBuffer()
      ..write('BadRequestException: ')
      ..write(message);
    return b.toString();
  }
}

class UnauthorizedAccessException extends HttpException {
  UnauthorizedAccessException(
      {String message = 'User not allowed to perform this operation'})
      : super(message);

  @override
  String toString() {
    var b = StringBuffer()
      ..write('UnauthorizedAccessException: ')
      ..write(message);
    return b.toString();
  }
}

class ResourceNotFoundException extends HttpException {
  ResourceNotFoundException({String message = ''}) : super(message);

  @override
  String toString() {
    var b = StringBuffer()
      ..write('ResourceNotFoundException: ')
      ..write(message);
    return b.toString();
  }
}

class ServerException {
  final String code;
  final List<String> messages;

  ServerException(this.code, this.messages);
}

class CacheException {
  final String code;
  final List<String> messages;

  CacheException(this.code, this.messages);
}
