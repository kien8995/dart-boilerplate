import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

import '../controllers/root_controller.dart';

Future<void> main(List<String> args) async {
  final RootController rootController = RootController();

  // Configure a pipeline that logs requests.
  final Handler handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(rootController.handler);

  // Use any available host or container IP (usually `0.0.0.0`).
  final InternetAddress ip = InternetAddress.anyIPv4;

  // For running in containers, we respect the PORT environment variable.
  final int port = int.parse(Platform.environment['PORT'] ?? '1102');

  final HttpServer server = await serve(handler, ip, port);
  server.autoCompress = true;

  // ignore: avoid_print
  print('Serving at http://${server.address.host}:${server.port}');
}
