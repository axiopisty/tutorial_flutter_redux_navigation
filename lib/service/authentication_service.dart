
import 'package:tutorial_flutter_redux_navigation/models/credentials.dart';
import 'package:tutorial_flutter_redux_navigation/models/user_model.dart';

abstract class AuthenticationService {
  Future<UserModel?> login(Credentials credentials);
  Future<void> logout();
}
