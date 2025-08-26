

import 'package:vaden/vaden.dart';

@DTO()
class  ResponseError {
  final String error;
  ResponseError(this.error);


  static ResponseException notFound(String message) {
    return ResponseException(404, ResponseError(message));
  }

  static ResponseException forbidden(String message) {
    return ResponseException(403, ResponseError(message));
  }

  static ResponseException internalServerError(String message) {
    return ResponseException(500, ResponseError(message));
  }

  static ResponseException badRequest(String message) {
    return ResponseException(400, ResponseError(message));
  }

  static ResponseException unauthorized(String message) {
    return ResponseException(401, ResponseError(message));
  }

  
}