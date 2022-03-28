import 'package:boilerplate/boilerplate.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final Awesome awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
