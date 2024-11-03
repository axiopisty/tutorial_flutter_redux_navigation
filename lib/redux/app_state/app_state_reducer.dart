import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:tutorial_flutter_redux_navigation/redux/app_state/app_state.dart';
import 'package:tutorial_flutter_redux_navigation/redux/auth_state/auth_state_actions.dart';
import 'package:tutorial_flutter_redux_navigation/redux/auth_state/auth_state_reducer.dart';

class AppStateReducer {
  static Reducer<AppState> reduce = combineReducers<AppState>([
    TypedReducer<AppState, AuthStateAction>(_authStateReducer).call,
  ]);

  static AppState _authStateReducer(AppState state, AuthStateAction action) {
    debugPrint('AppStateReducer._authStateReducer: $action');
    return state.rebuild(
      (b) => b
        ..authState = AuthStateReducer.reduce(
          state.authState,
          action,
        ).toBuilder(),
    );
  }
}
