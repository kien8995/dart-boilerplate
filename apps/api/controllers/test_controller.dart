import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

final Map<String, String> cors = <String, String>{
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Request-Headers': '*',
  'Access-Control-Resqust-Method': '*'
};

class TestController {
  // By exposing a [Router] for an object, it can be mounted in other routers.
  Router get router {
    final Router router = Router();

    // get request to "/test"
    router.get('/', (Request req) {
      return Response.ok('The Test Controller', headers: cors);
    });

    // get request to "/test/<param>?query=????"
    router.get('/<param>', (Request req, String param) {
      // ignore: avoid_print
      print(req.url.queryParameters['query']); // acessing a url query
      return Response.ok(param);
    });

    // catch all for "/test"
    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
