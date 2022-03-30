import 'dart:io';

import 'http_exception.dart';

// 501 Not Implemented
class NotImplementedException extends HttpException {
  const NotImplementedException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.notImplemented,
            message: "Not Implemented${detail != '' ? ': ' : ''}$detail",
            data: data);
}
