import 'package:built_value/built_value.dart';
import 'package:tutorial_flutter_redux_navigation/models/user_model.dart';
import 'package:tutorial_flutter_redux_navigation/redux/auth_state/auth_state_actions.dart';
import 'package:tutorial_flutter_redux_navigation/redux/auth_state/auth_state_middleware.dart';

part 'auth_state.g.dart';

/// [AuthState] holds all state related to user authentication.
///
/// See also: [AuthStateMiddleware]
/// See also: [AuthStateReducer]
/// See also: [AuthStateAction]
abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  /// The logged in user
  UserModel? get user;

  /// True if authentication is in progress, else false
  bool get isAuthenticating;

  /// The error message to display if authentication fails
  String get loginErrorMessage;

  /// True if logout is in progress, else false
  bool get isLoggingOut;

  /// The error message to display if logout fails
  String get logoutErrorMessage;

  /// True if the user is authenticated, else false
  bool get isAuthenticated => user != null;

  factory AuthState.initial() {
    return AuthState(
      (b) => b
        ..user = null
        ..isAuthenticating = false
        ..loginErrorMessage = ''
        ..isLoggingOut = false
        ..logoutErrorMessage = '',
    );
  }

  factory AuthState([void Function(AuthStateBuilder) updates]) = _$AuthState;

  AuthState._();
}
