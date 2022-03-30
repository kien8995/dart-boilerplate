import 'dart:convert';

import 'package:shelf/shelf.dart';

enum StatusType { success, error }

class ServerResponse {
  ServerResponse(
    this.message, {
    this.type = StatusType.success,
    this.body,
  });

  final String message;
  final dynamic body;
  final StatusType type;

  Map<String, dynamic> toJson() {
    return <String, String>{
      'status': type.toString().replaceAll('StatusType.', ''),
      'message': message,
      'body': body ?? '',
    };
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  Response ok() {
    return Response.ok(
      toJsonString(),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
  }
}
