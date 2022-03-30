import 'dart:io';

class FileUtil {
  static Future<void> createIfNot(Directory directory) async {
    // ignore: avoid_slow_async_io
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
  }
}
