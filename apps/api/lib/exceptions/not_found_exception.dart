import 'dart:io';

import 'http_exception.dart';

// 404 Not Found
class NotFoundException extends HttpException {
  const NotFoundException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.notFound,
            message: "Not Found${detail != '' ? ': ' : ''}$detail",
            data: data);
}
