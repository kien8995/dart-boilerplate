import 'dart:io';

import 'http_exception.dart';

// 412 Precondition Failed
class PreconditionFailedException extends HttpException {
  const PreconditionFailedException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.preconditionFailed,
            message: "Precondition Failed${detail != '' ? ': ' : ''}$detail",
            data: data);
}
