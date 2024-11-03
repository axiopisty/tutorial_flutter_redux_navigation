// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthState extends AuthState {
  @override
  final UserModel? user;
  @override
  final bool isAuthenticating;
  @override
  final String loginErrorMessage;
  @override
  final bool isLoggingOut;
  @override
  final String logoutErrorMessage;

  factory _$AuthState([void Function(AuthStateBuilder)? updates]) =>
      (new AuthStateBuilder()..update(updates))._build();

  _$AuthState._(
      {this.user,
      required this.isAuthenticating,
      required this.loginErrorMessage,
      required this.isLoggingOut,
      required this.logoutErrorMessage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isAuthenticating, r'AuthState', 'isAuthenticating');
    BuiltValueNullFieldError.checkNotNull(
        loginErrorMessage, r'AuthState', 'loginErrorMessage');
    BuiltValueNullFieldError.checkNotNull(
        isLoggingOut, r'AuthState', 'isLoggingOut');
    BuiltValueNullFieldError.checkNotNull(
        logoutErrorMessage, r'AuthState', 'logoutErrorMessage');
  }

  @override
  AuthState rebuild(void Function(AuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthStateBuilder toBuilder() => new AuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthState &&
        user == other.user &&
        isAuthenticating == other.isAuthenticating &&
        loginErrorMessage == other.loginErrorMessage &&
        isLoggingOut == other.isLoggingOut &&
        logoutErrorMessage == other.logoutErrorMessage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, isAuthenticating.hashCode);
    _$hash = $jc(_$hash, loginErrorMessage.hashCode);
    _$hash = $jc(_$hash, isLoggingOut.hashCode);
    _$hash = $jc(_$hash, logoutErrorMessage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthState')
          ..add('user', user)
          ..add('isAuthenticating', isAuthenticating)
          ..add('loginErrorMessage', loginErrorMessage)
          ..add('isLoggingOut', isLoggingOut)
          ..add('logoutErrorMessage', logoutErrorMessage))
        .toString();
  }
}

class AuthStateBuilder implements Builder<AuthState, AuthStateBuilder> {
  _$AuthState? _$v;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  bool? _isAuthenticating;
  bool? get isAuthenticating => _$this._isAuthenticating;
  set isAuthenticating(bool? isAuthenticating) =>
      _$this._isAuthenticating = isAuthenticating;

  String? _loginErrorMessage;
  String? get loginErrorMessage => _$this._loginErrorMessage;
  set loginErrorMessage(String? loginErrorMessage) =>
      _$this._loginErrorMessage = loginErrorMessage;

  bool? _isLoggingOut;
  bool? get isLoggingOut => _$this._isLoggingOut;
  set isLoggingOut(bool? isLoggingOut) => _$this._isLoggingOut = isLoggingOut;

  String? _logoutErrorMessage;
  String? get logoutErrorMessage => _$this._logoutErrorMessage;
  set logoutErrorMessage(String? logoutErrorMessage) =>
      _$this._logoutErrorMessage = logoutErrorMessage;

  AuthStateBuilder();

  AuthStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user?.toBuilder();
      _isAuthenticating = $v.isAuthenticating;
      _loginErrorMessage = $v.loginErrorMessage;
      _isLoggingOut = $v.isLoggingOut;
      _logoutErrorMessage = $v.logoutErrorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthState;
  }

  @override
  void update(void Function(AuthStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthState build() => _build();

  _$AuthState _build() {
    _$AuthState _$result;
    try {
      _$result = _$v ??
          new _$AuthState._(
              user: _user?.build(),
              isAuthenticating: BuiltValueNullFieldError.checkNotNull(
                  isAuthenticating, r'AuthState', 'isAuthenticating'),
              loginErrorMessage: BuiltValueNullFieldError.checkNotNull(
                  loginErrorMessage, r'AuthState', 'loginErrorMessage'),
              isLoggingOut: BuiltValueNullFieldError.checkNotNull(
                  isLoggingOut, r'AuthState', 'isLoggingOut'),
              logoutErrorMessage: BuiltValueNullFieldError.checkNotNull(
                  logoutErrorMessage, r'AuthState', 'logoutErrorMessage'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
