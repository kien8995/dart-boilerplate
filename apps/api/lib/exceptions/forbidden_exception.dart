import 'dart:io';

import 'http_exception.dart';

// 403 Forbidden
class ForbiddenException extends HttpException {
  const ForbiddenException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.forbidden,
            message: "Forbidden${detail != '' ? ': ' : ''}$detail",
            data: data);
}
