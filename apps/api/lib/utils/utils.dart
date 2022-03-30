import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

String generateSalt([int length = 32]) {
  final Random rand = Random.secure();
  final List<int> saltBytes =
      List<int>.generate(length, (_) => rand.nextInt(256));
  return base64.encode(saltBytes);
}

String hashPassword(String password, String salt) {
  const Utf8Codec codec = Utf8Codec();
  final List<int> key = codec.encode(password);
  final List<int> saltBytes = codec.encode(salt);
  final Hmac hmac = Hmac(sha256, key);
  final Digest digest = hmac.convert(saltBytes);
  return digest.toString();
}

String generateJwt(
  String subject,
  String issuer,
  String secret, {
  required String jwtId,
  Duration expiry = const Duration(seconds: 400),
}) {
  final JWT jwt = JWT(
    {
      'iat': DateTime.now().millisecondsSinceEpoch,
    },
    subject: subject,
    issuer: issuer,
    jwtId: jwtId,
  );
  return jwt.sign(SecretKey(secret), expiresIn: expiry);
}

JWT? verifyJwt(String token, String secret) {
  try {
    final JWT jwt = JWT.verify(token, SecretKey(secret));
    return jwt;
  } on JWTExpiredError {
    throw JWTExpiredError();
  } on JWTError catch (err) {
    throw JWTError('JWT error:$err');
  }
}
