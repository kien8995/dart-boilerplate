import 'dart:io';

import 'http_exception.dart';

// 503 Service Unavailable
class ServiceUnavailableException extends HttpException {
  const ServiceUnavailableException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.serviceUnavailable,
            message: "Service Unavailable${detail != '' ? ': ' : ''}$detail",
            data: data);
}
