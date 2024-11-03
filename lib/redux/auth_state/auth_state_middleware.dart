import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:tutorial_flutter_redux_navigation/redux/app_state/app_state.dart';
import 'package:tutorial_flutter_redux_navigation/redux/auth_state/auth_state_actions.dart';
import 'package:tutorial_flutter_redux_navigation/service/authentication_service.dart';

class AuthStateMiddleware {
  final AuthenticationService authenticationService;
  late List<Middleware<AppState>> middleware;

  AuthStateMiddleware({required this.authenticationService}) {
    middleware = [
      TypedMiddleware<AppState, AuthenticationRequest>(_authenticate).call,
      TypedMiddleware<AppState, LogoutAction>(_logout).call,
    ];
  }

  Future<void> _authenticate(
    Store<AppState> store,
    AuthenticationRequest action,
    NextDispatcher _,
  ) async {
    debugPrint('AuthStateMiddleware._authenticate: $action');
    store.dispatch(AuthenticationInProgress());
    final credentials = action.credentials;
    try {
      final authenticated = await authenticationService.login(credentials);
      if (authenticated != null) {
        debugPrint('AuthStateMiddleware._authenticate: Authentication successful');
        store.dispatch(AuthenticationSuccess(user: authenticated));
      } else {
        debugPrint('AuthStateMiddleware._authenticate: Authentication failed');
        store.dispatch(AuthenticationFailed(
          errorMessage: 'Authentication failed',
        ));
      }
    } catch (e) {
      debugPrint('AuthStateMiddleware._authenticate: Authentication failed because: $e');
      store.dispatch(AuthenticationFailed(errorMessage: e.toString()));
      return;
    }
  }

  Future<void> _logout(
    Store<AppState> store,
    LogoutAction action,
    NextDispatcher _,
  ) async {
    debugPrint('AuthStateMiddleware._logout: $action');
    store.dispatch(LogoutInProgress());
    try {
      await authenticationService.logout();
      debugPrint('AuthStateMiddleware._logout: Logout successful');
      store.dispatch(LogoutSuccess());
    } catch (e) {
      debugPrint('AuthStateMiddleware._logout: Logout failed because: $e');
      store.dispatch(LogoutFailed(errorMessage: e.toString()));
      return;
    }
  }
}
