import 'dart:io';

import 'http_exception.dart';

// 415 Unsupported Media Type
class UnsupportedMediaTypeException extends HttpException {
  const UnsupportedMediaTypeException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.unsupportedMediaType,
            message: "Unsupported Media Type${detail != '' ? ': ' : ''}$detail",
            data: data);
}
