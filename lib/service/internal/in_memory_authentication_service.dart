import 'package:flutter/foundation.dart';
import 'package:tutorial_flutter_redux_navigation/models/credentials.dart';
import 'package:tutorial_flutter_redux_navigation/models/user_model.dart';
import 'package:tutorial_flutter_redux_navigation/service/authentication_service.dart';

class InMemoryAuthenticationService implements AuthenticationService {

  static const delay = Duration(milliseconds: 200);

  final Map<String, String> _passwords = {
    "test@test.com": "test",
  };

  final Map<String, String> _userNames = {
    "test@test.com": "Test User",
  };

  /// The currently authenticated user.
  UserModel? _authenticatedUser;

  @override
  Future<UserModel?> login(Credentials credentials) async {
    debugPrint('InMemoryAuthenticationService.login($credentials)');
    // Simulate a network request...
    await Future.delayed(delay, () {
      final email = credentials.email;
      final pw = _passwords[email];
      final name = _userNames[email];
      if (pw != null && pw == credentials.password && name != null) {
        debugPrint('InMemoryAuthenticationService.login: login successful');
        _authenticatedUser = UserModel.from(name, email);
      } else {
        debugPrint('InMemoryAuthenticationService.login: login failed');
        _authenticatedUser = null;
      }
    });
    return _authenticatedUser;
  }

  @override
  Future<void> logout() async {
    debugPrint('InMemoryAuthenticationService.logout: logging out user');
    // Simulate a network request...
    await Future.delayed(delay, () {
      if (_authenticatedUser != null) {
        _authenticatedUser = null;
        debugPrint('InMemoryAuthenticationService.logout: user logged out');
      }
    });
  }
}
