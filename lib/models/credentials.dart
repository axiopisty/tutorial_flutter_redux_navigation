import 'package:built_value/built_value.dart';

part 'credentials.g.dart';

abstract class Credentials implements Built<Credentials, CredentialsBuilder> {

  String get email;

  String get password;

  /// Named constructor to easily create [Credentials] with email and password.
  factory Credentials.from(String email, String password) {
    return Credentials(
      (b) => b
        ..email = email
        ..password = password,
    );
  }

  factory Credentials([void Function(CredentialsBuilder) updates]) =
      _$Credentials;

  Credentials._();
}
