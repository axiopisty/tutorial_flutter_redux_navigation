import 'package:built_value/built_value.dart';
import 'package:tutorial_flutter_redux_navigation/redux/auth_state/auth_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AuthState get authState;

  factory AppState.initial() {
    return AppState(
      (b) => b..authState = AuthState.initial().toBuilder(),
    );
  }

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  AppState._();
}
