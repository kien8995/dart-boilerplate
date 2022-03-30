import 'dart:io';

import 'http_exception.dart';

// 406 Not Acceptable
class NotAcceptableException extends HttpException {
  const NotAcceptableException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.notAcceptable,
            message: "Not Acceptable${detail != '' ? ': ' : ''}$detail",
            data: data);
}
