import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';
import 'package:tutorial_flutter_redux_navigation/models/user_model.dart';
import 'package:tutorial_flutter_redux_navigation/redux/app_state/app_state.dart';
import 'package:tutorial_flutter_redux_navigation/redux/auth_state/auth_state_actions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: StoreConnector<AppState, _HomePageViewModel>(
            converter: (store) => _HomePageViewModel.fromStore(store),
            builder: (context, viewModel) {
              return viewModel.isAuthenticated
                  ? _AuthenticatedHomePage(viewModel: viewModel)
                  : _UnauthenticatedHomePage(viewModel: viewModel);
            },
          ),
        ),
      ),
    );
  }
}

class _UnauthenticatedHomePage extends StatelessWidget {
  final _HomePageViewModel viewModel;

  const _UnauthenticatedHomePage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Home Page',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            context.go('/login');
          },
          child: const Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

class _AuthenticatedHomePage extends StatelessWidget {
  final _HomePageViewModel viewModel;

  const _AuthenticatedHomePage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Logged in as ${viewModel.user!.email}',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            viewModel.logout();
          },
          child: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

class _HomePageViewModel {
  final Store<AppState> store;
  final UserModel? user;

  _HomePageViewModel({
    required this.store,
    required this.user,
  });

  bool get isAuthenticated => user != null;

  static _HomePageViewModel fromStore(Store<AppState> store) {
    return _HomePageViewModel(
      store: store,
      user: store.state.authState.user,
    );
  }

  Future<void> logout() async {
    debugPrint('HomePageViewModel.logout');
    store.dispatch(LogoutAction());
  }
}
