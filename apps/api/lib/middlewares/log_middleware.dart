import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';

Middleware logMiddleware(String name) => (Handler innerHandler) {
      return (Request request) {
        Logger.root.info('[$name]');
        return innerHandler(request);
      };
    };
