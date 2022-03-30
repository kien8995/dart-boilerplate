import 'package:shelf/shelf.dart';

Middleware errorHandlerMiddleware() {
  return (Handler innerHandler) {
    return (Request request) async {
      try {
        return await innerHandler(request);
      } catch (e) {
        return Response(403);
      }
    };
  };
}

// /**
//  * A middleware that allows handlers to simply throw [HttpExceptions]
//  * instead of having to create and return a non successful [Response].
//  *
//  * Example:
//  * (request) {
//  *    if(notA) {
//  *      throw(301, "You have to be A");
//  *    }
//  *    return new Response();
//  * }
//  */
// shelf.Middleware exceptionResponse() {
//   return (shelf.Handler handler) {
//     return (shelf.Request request) {
//         return new Future.sync(() => handler(request)).then((response) => response).catchError((error, stackTrace) {
//           FormatResult result = formatter.formatResponse(request, error.toMap());
//           return new shelf.Response(error.status, body: result.body, headers: {HttpHeaders.CONTENT_TYPE:result.contentType});
//         }, test: (e) =>e is HttpException);
//     };
//   };
// }