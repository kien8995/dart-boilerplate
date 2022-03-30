import 'dart:io';

import 'http_exception.dart';

// 500 Internal Server Error
class InternalServerErrorException extends HttpException {
  const InternalServerErrorException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.internalServerError,
            message: "Internal Server Error${detail != '' ? ': ' : ''}$detail",
            data: data);
}
