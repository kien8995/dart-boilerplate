import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'echo_controller.dart';
import 'test_controller.dart';

class RootController {
  // The handler/middleware that will be used by the server, all the routing for the server will be implemented here.
  Handler get handler {
    final Router router = Router();

    // GET
    // Replies with the text inserted in the path, example: http://localhost:1102/.
    router.get('/', (Request request) {
      return Response.ok('Hi');
    });

    // You can also embed other routers, in this case it will help organizer your routers
    // Note: This needs be before the catch 'router.all' that follows
    router
      ..mount('/echo/', EchoController().router)
      ..mount('/test/', TestController().router);

    // A catch all of the non implemented routing, useful for showing 404 page now found
    // With the server running try to open http://localhost:1102/abc
    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not found');
    });

    return router;
  }
}
