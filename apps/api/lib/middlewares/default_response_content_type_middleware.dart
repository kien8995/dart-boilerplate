import 'package:shelf/shelf.dart';

Middleware defaultResponseContentType(String contentType) {
  return (Handler innerHandler) {
    return (Request resquest) async {
      final Response response = await innerHandler(resquest);
      final Map<String, String> mapHeaders = <String, String>{
        ...response.headers,
        'content-type': contentType,
      };
      return response.change(headers: mapHeaders);
    };
  };
}
