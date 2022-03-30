import 'dart:io';

import 'http_exception.dart';

// 405 Method Not Allowed
class MethodNotAllowedException extends HttpException {
  const MethodNotAllowedException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.methodNotAllowed,
            message: "Method Not Allowed${detail != '' ? ': ' : ''}$detail",
            data: data);
}
