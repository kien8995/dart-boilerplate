import 'dart:io';

import 'http_exception.dart';

// 409 Conflict
class ConflictException extends HttpException {
  const ConflictException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.conflict,
            message: "Conflict${detail != '' ? ': ' : ''}$detail",
            data: data);
}
