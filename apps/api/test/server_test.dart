import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:test_process/test_process.dart';

void main() {
  const String port = '8080';
  const String host = 'http://0.0.0.0:$port';

  setUp(() async {
    await TestProcess.start(
      'dart',
      <String>['run', 'bin/server.dart'],
      environment: {'PORT': port},
    );
  });

  test('Root', () async {
    final Response response = await get(Uri.parse('$host/'));
    expect(response.statusCode, 200);
    expect(response.body, 'Hello, World!\n');
  });

  test('Echo', () async {
    final Response response = await get(Uri.parse('$host/echo/hello'));
    expect(response.statusCode, 200);
    expect(response.body, 'hello\n');
  });
  test('404', () async {
    final Response response = await get(Uri.parse('$host/foobar'));
    expect(response.statusCode, 404);
  });
}
