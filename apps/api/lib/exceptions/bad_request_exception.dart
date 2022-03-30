import 'dart:io';

import 'http_exception.dart';

// 400 Bad Request
class BadRequestException extends HttpException {
  const BadRequestException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.badRequest,
            message: "Bad Request${detail != '' ? ': ' : ''}$detail",
            data: data);
}
