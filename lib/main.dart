import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:tutorial_flutter_redux_navigation/redux/app_state/app_state.dart';
import 'package:tutorial_flutter_redux_navigation/redux/app_state/app_state_reducer.dart';
import 'package:tutorial_flutter_redux_navigation/redux/auth_state/auth_state_middleware.dart';
import 'package:tutorial_flutter_redux_navigation/routes.dart';
import 'package:tutorial_flutter_redux_navigation/service/internal/in_memory_authentication_service.dart';

void main() {
  var authService = InMemoryAuthenticationService();
  var authStateMiddleware = AuthStateMiddleware(
    authenticationService: authService,
  );

  final Store<AppState> store = Store<AppState>(
    AppStateReducer.reduce,
    initialState: AppState.initial(),
    middleware: [
      ...authStateMiddleware.middleware,
    ],
  );

  runApp(MainApp(store: store));
}

class MainApp extends StatelessWidget {
  final Store<AppState> store;

  const MainApp({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
