import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../utils/utils.dart';

Middleware authMiddleware(String secret) {
  return (Handler innerHandler) {
    return (Request request) async {
      final String? authHeader = request.headers['authorization'];
      dynamic token, jwt;

      if (authHeader != null && authHeader.startsWith('Bearer ')) {
        token = authHeader.substring(7);
        jwt = verifyJwt(token, secret);
      }

      final Request updatedRequest = request.change(context: {
        'authDetails': jwt,
      });
      return await innerHandler(updatedRequest);
    };
  };
}

Middleware handleAuth(String secret) {
  return (Handler innerHandler) {
    return (Request request) async {
      final Request updatedRequest;
      try {
        String token = request.headers['Authorization']!;
        if (token.startsWith('Bearer ')) {
          token = token.substring(7);
        }
        final JWT jwt = JWT.verify(token, SecretKey(secret));
        updatedRequest =
            request.change(context: <String, Object?>{'id': jwt.payload['id']});
      } catch (e) {
        // print('handleAuth: $e');
        return Response(401);
      }
      return await innerHandler(updatedRequest);
    };
  };
}

Middleware handle() {
  return createMiddleware(requestHandler: (request) {
    if (request.requestedUri.path != '/login') {
      if (request.headers['token'] == null) {
        return Response(401, body: 'unauthentication');
      }
    }
    return null;
  });
}
