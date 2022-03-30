import 'package:shelf/shelf.dart';

Middleware httpsOnlyMiddleware() {
  return createMiddleware(requestHandler: (Request request) {
    if (request.requestedUri.scheme != 'https') {
      return Response.movedPermanently(
          request.requestedUri.replace(scheme: 'https'));
    }
    return null;
  });
}
