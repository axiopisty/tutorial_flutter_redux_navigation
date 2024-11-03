import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';
import 'package:tutorial_flutter_redux_navigation/models/credentials.dart';
import 'package:tutorial_flutter_redux_navigation/models/user_model.dart';
import 'package:tutorial_flutter_redux_navigation/redux/app_state/app_state.dart';
import 'package:tutorial_flutter_redux_navigation/redux/auth_state/auth_state_actions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: StoreConnector<AppState, _Form>(
            converter: (store) => _Form.fromStore(store),
            builder: (context, form) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo or Icon
                  const Icon(
                    Icons.lock_outline,
                    size: 80,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 20),

                  // App Title
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Display error message if there is a login error
                  if (form.loginErrorMessage.isNotEmpty)
                    Text(
                      form.loginErrorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  if (form.loginErrorMessage.isNotEmpty)
                    const SizedBox(height: 20),

                  // Email TextField
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password TextField
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Display a progress indicator if login is in progress
                  if (form.isAuthenticating) const CircularProgressIndicator(),
                  // if (form.isAuthenticating) const SizedBox(height: 20),

                  // Login Button
                  if (!form.isAuthenticating && form.user == null)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          form.login(email, password);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  if (form.user == null) const SizedBox(height: 10),
                  if (form.user != null)
                    InkWell(
                      onTap: () {
                        context.go('/');
                      },
                      child: const Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Form {
  final Store<AppState> store;
  final bool isAuthenticating;
  final String loginErrorMessage;
  final UserModel? user;

  _Form({
    required this.store,
    required this.isAuthenticating,
    required this.loginErrorMessage,
    required this.user,
  });

  static _Form fromStore(Store<AppState> store) {
    var authState = store.state.authState;
    return _Form(
      store: store,
      isAuthenticating: authState.isAuthenticating,
      loginErrorMessage: authState.loginErrorMessage,
      user: authState.user,
    );
  }

  Future<void> login(String email, String password) async {
    debugPrint("loginPage: login($email, $password) invoked");
    store.dispatch(AuthenticationRequest(
      credentials: Credentials.from(email, password),
    ));
  }
}
