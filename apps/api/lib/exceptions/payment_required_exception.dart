import 'dart:io';

import 'http_exception.dart';

// 402 Payment Required
class PaymentRequiredException extends HttpException {
  const PaymentRequiredException(
      {required Map<String, dynamic> data, String detail = ''})
      : super(
            status: HttpStatus.paymentRequired,
            message: "Payment Required${detail != '' ? ': ' : ''}$detail",
            data: data);
}
