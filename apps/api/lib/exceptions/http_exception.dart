import 'dart:io';

/// HTTP exception enables to immediately stop request execution
/// and send an appropriate error message to the client. An option
/// [Map] data can be provided to add additional information as
/// the response body.
class HttpException implements Exception {
  const HttpException(
      {required this.status, required this.message, required this.data});

  final int status;
  final String message;
  final Map<String, dynamic> data;

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> result = <String, dynamic>{
      'status': status,
      'message': message
    };
    if (data != null && data.isNotEmpty) {
      data.forEach((String name, dynamic value) {
        result[name] = value;
      });
    }
    return result;
  }

  @override
  String toString() {
    return 'Status ${status.toString()}: $message';
  }
}
