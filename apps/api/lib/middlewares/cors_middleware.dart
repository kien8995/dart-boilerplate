import 'dart:io';

import 'package:shelf/shelf.dart';

const Map<String, String> defaultCorsHeader = <String, String>{
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PATH, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Header':
      '${HttpHeaders.contentTypeHeader}, ${HttpHeaders.authorizationHeader}',
};

Middleware corsMiddleware({Map<String, String> headers = defaultCorsHeader}) {
  return (Handler innerHandler) {
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response(
          HttpStatus.ok,
          headers: headers,
        );
      }
      final Map<String, String> mapHeaders = <String, String>{
        ...request.headers,
        ...headers
      };
      final Response response =
          await innerHandler(request.change(headers: mapHeaders));

      return response.change(headers: headers);
    };
  };
}
