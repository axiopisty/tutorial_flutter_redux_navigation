import 'package:tutorial_flutter_redux_navigation/models/credentials.dart';
import 'package:tutorial_flutter_redux_navigation/models/user_model.dart';
import 'package:tutorial_flutter_redux_navigation/redux/auth_state/auth_state_middleware.dart';

/// A marker interface for all actions that
/// are related to the [AuthState].
sealed class AuthStateAction {}

/// Dispatched by the UI to initiate authentication logic.
///
/// Handled asynchronously by [authStateMiddleware].
class AuthenticationRequest extends AuthStateAction {
  final Credentials credentials;

  AuthenticationRequest({
    required this.credentials,
  });
}

/// Dispatched my [authStateMiddleware] when authentication
/// is in progress.
///
/// Handled by [authStateReducer] to enable user notifications
/// in the UI, such as a spinner.
class AuthenticationInProgress extends AuthStateAction {}

/// Dispatched by [authStateMiddleware] when authentication
/// fails.
///
/// Handled by [authStateReducer] to enable user notifications.
class AuthenticationFailed extends AuthStateAction {
  final String errorMessage;

  AuthenticationFailed({required this.errorMessage});
}

/// Dispatched by [authStateMiddleware] when authentication
/// is successful.
///
/// Handled by [authStateReducer] to update the [AuthState].
class AuthenticationSuccess extends AuthStateAction {
  final UserModel user;

  AuthenticationSuccess({required this.user});
}

/// Dispatched by the UI to log out the current user.
///
/// Handled by [AuthStateMiddleware] to clear the current
/// user session.
class LogoutAction extends AuthStateAction {}

/// Dispatched by [authStateMiddleware] when logout is in
/// progress.
///
/// Handled by [authStateReducer] to enable user notifications,
/// such as a spinner.
class LogoutInProgress extends AuthStateAction {}

/// Dispatched by [authStateMiddleware] when logout fails.
///
/// Handled by [authStateReducer] to enable user notifications.
class LogoutFailed extends AuthStateAction {
  final String errorMessage;

  LogoutFailed({required this.errorMessage});
}

/// Dispatched by [authStateMiddleware] when logout is successful.
///
/// Handled by [authStateReducer] to update the [AuthState].
class LogoutSuccess extends AuthStateAction {}
