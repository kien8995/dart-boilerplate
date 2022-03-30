import 'dart:io';

import 'http_exception.dart';

// 429 Too Many Requests
class TooManyRequestsException extends HttpException {
  const TooManyRequestsException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.tooManyRequests,
            message: "Too Many Requests${detail != '' ? ': ' : ''}$detail",
            data: data);
}
