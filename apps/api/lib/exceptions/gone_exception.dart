import 'dart:io';

import 'http_exception.dart';

// 410 Gone
class GoneException extends HttpException {
  const GoneException({required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.gone,
            message: "Gone${detail != '' ? ': ' : ''}$detail",
            data: data);
}
