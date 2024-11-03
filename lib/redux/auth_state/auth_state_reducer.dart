import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:tutorial_flutter_redux_navigation/redux/auth_state/auth_state_actions.dart';

import 'auth_state.dart';

class AuthStateReducer {

  static Reducer<AuthState> reduce = combineReducers<AuthState>([
    TypedReducer<AuthState, AuthenticationInProgress>(_authInProgress).call,
    TypedReducer<AuthState, AuthenticationFailed>(_authFailed).call,
    TypedReducer<AuthState, AuthenticationSuccess>(_authSuccess).call,
    TypedReducer<AuthState, LogoutInProgress>(_logoutInProgress).call,
    TypedReducer<AuthState, LogoutFailed>(_logoutFailed).call,
    TypedReducer<AuthState, LogoutSuccess>(_logoutSuccess).call,
  ]);

  /// Handles the authentication in progress action by
  /// setting the [AuthState.isAuthenticating] flag to true and
  /// clearing the [AuthState.loginErrorMessage].
  static AuthState _authInProgress(
    AuthState state,
    AuthenticationInProgress _,
  ) {
    debugPrint('AuthStateReducer._authInProgress');
    return state.rebuild(
      (b) => b
        ..isAuthenticating = true
        ..loginErrorMessage = '',
    );
  }

  /// Handles the authentication failed action by
  /// setting the [AuthState.isAuthenticating] flag to false and
  /// setting the [AuthState.loginErrorMessage] to the error message.
  static AuthState _authFailed(
    AuthState state,
    AuthenticationFailed action,
  ) {
    debugPrint('AuthStateReducer._authFailed');
    return state.rebuild(
      (b) => b
        ..isAuthenticating = false
        ..loginErrorMessage = action.errorMessage,
    );
  }

  /// Handles the authentication success action by
  /// setting the [AuthState.isAuthenticating] flag to false,
  /// clearing the [AuthState.loginErrorMessage] and  setting the
  /// authenticated [AuthState.user].
  static AuthState _authSuccess(
    AuthState state,
    AuthenticationSuccess action,
  ) {
    debugPrint('AuthStateReducer._authSuccess');
    return state.rebuild(
      (b) => b
        ..isAuthenticating = false
        ..loginErrorMessage = ''
        ..user = action.user.toBuilder(),
    );
  }

  /// Handles the logout in progress action by
  /// setting the [AuthState.isLoggingOut] flag to true and
  /// clearing the [AuthState.logoutErrorMessage].
  static AuthState _logoutInProgress(
    AuthState state,
    LogoutInProgress _,
  ) {
    debugPrint('AuthStateReducer._logoutInProgress');
    return state.rebuild(
      (b) => b
        ..isLoggingOut = true
        ..logoutErrorMessage = '',
    );
  }

  /// Handles the logout failed action by
  /// setting the [AuthState.isLoggingOut] flag to false and
  /// setting the [AuthState.logoutErrorMessage] to the error message.
  static AuthState _logoutFailed(
    AuthState state,
    LogoutFailed action,
  ) {
    debugPrint('AuthStateReducer._logoutFailed');
    return state.rebuild(
      (b) => b
        ..isLoggingOut = false
        ..logoutErrorMessage = action.errorMessage,
    );
  }

  /// Handles the logout success action by
  /// setting the [AuthState.isLoggingOut] flag to false,
  /// clearing the [AuthState.logoutErrorMessage] and
  /// clearing the [AuthState.user].
  static AuthState _logoutSuccess(
    AuthState state,
    LogoutSuccess _,
  ) {
    debugPrint('AuthStateReducer._logoutSuccess');
    return state.rebuild(
      (b) => b
        ..isLoggingOut = false
        ..logoutErrorMessage = ''
        ..user = null,
    );
  }

}
