import 'dart:io';

import 'http_exception.dart';

// 401 Unauthorized
class UnauthorizedException extends HttpException {
  const UnauthorizedException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.unauthorized,
            message: "Unauthorized${detail != '' ? ': ' : ''}$detail",
            data: data);
}
