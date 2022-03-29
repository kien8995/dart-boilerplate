import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class EchoController {
  Router get router {
    final Router router = Router();

    router
      ..get('/messages', _messages)
      ..get('/messages/', _messages)
      ..post('/messages/', _messages)
      ..put('/messages/', _messages)
      ..delete('/messages/', _messages)
      ..all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }

  Future<Response> _messages(Request request) async {
    return Response.ok(request.url.toString());
  }
}
