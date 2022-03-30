import 'dart:io';

import 'package:api/controllers/root_controller.dart';
import 'package:args/args.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

Future<void> main(List<String> args) async {
  final ArgParser parser = ArgParser()..addOption('port', abbr: 'p');
  final ArgResults result = parser.parse(args);

  final RootController rootController = RootController();

  // Configure a pipeline that logs requests.
  final Handler handler = const Pipeline()
      .addMiddleware(corsHeaders())
      .addMiddleware(logRequests())
      .addHandler(rootController.handler);

  // Use any available host or container IP (usually `0.0.0.0`).
  final InternetAddress ip = InternetAddress.anyIPv4;

  // For running in containers, we respect the PORT environment variable.
  int port = int.parse(Platform.environment['PORT'] ?? '1102');

  // Override port env var with -p flag
  if (result['port'] != null) {
    try {
      port = int.parse(result['port']);
    } on FormatException {
      stdout.writeln(
          'Could not parse port value "${result['port']}" into a number.');
      exit(1);
    }
  }

  final HttpServer server = await serve(handler, ip, port);
  server.autoCompress = true;

  // ignore: avoid_print
  print('Serving at http://${server.address.host}:${server.port}');
}
