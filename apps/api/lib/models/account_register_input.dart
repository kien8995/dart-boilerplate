import 'dart:convert';

class AccountRegisterInput {
  const AccountRegisterInput({
    required this.email,
    required this.password,
  });

  factory AccountRegisterInput.fromMap(Map<String, dynamic> map) {
    return AccountRegisterInput(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  factory AccountRegisterInput.fromJson(String source) =>
      AccountRegisterInput.fromMap(json.decode(source));

  final String email;
  final String password;

  AccountRegisterInput copyWith({
    String? email,
    String? password,
  }) {
    return AccountRegisterInput(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'AccountRegisterInput(email: $email, password: $password)';
}
