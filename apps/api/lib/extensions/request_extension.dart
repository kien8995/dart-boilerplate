import 'dart:convert';

import 'package:shelf/shelf.dart';

extension RequestExtension on Request {
  Future<dynamic> readAsJson() async => jsonDecode(await readAsString());
}
