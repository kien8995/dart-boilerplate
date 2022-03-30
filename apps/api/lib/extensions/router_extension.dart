import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

extension RouterExtension on Router {
  void add404() {
    all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not found: "${request.url}"');
    });
  }
}
