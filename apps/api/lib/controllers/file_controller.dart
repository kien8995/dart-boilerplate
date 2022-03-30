import 'dart:convert';
import 'dart:io';

import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';
import 'package:uuid/uuid.dart';

class FileController {
  Router get router {
    final Router router = Router();

    // get request to "/test"
    router.get('/', (Request request) async {
      HeaderValue header =
          HeaderValue.parse(request.headers['content-type'] ?? '');
      String fileName = '';
      await for (final MimeMultipart part in request.read().transform(
          MimeMultipartTransformer(header.parameters['boundary'] ?? ''))) {
        if (part.headers.containsKey('content-disposition')) {
          header = HeaderValue.parse(part.headers['content-disposition'] ?? '');
          final String extension =
              basename(header.parameters['filename'] ?? '').split('.').last;
          fileName = '${const Uuid().v4()}.$extension';
          final File file = File('./upload/$fileName');
          await file.create(recursive: true);
          final IOSink fileSink = file.openWrite();
          await part.pipe(fileSink);
          await fileSink.close();
        }
      }
      return Response.ok(jsonEncode(<String, String>{'file': fileName}));
    });

    // get request to "/test/<param>?query=????"
    router.get('/<param>', (Request request, String param) {
      final Handler handler = createStaticHandler(
        'upload',
      );
      return handler(request);
    });

    // catch all for "/test"
    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
