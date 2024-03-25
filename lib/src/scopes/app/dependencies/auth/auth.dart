import 'package:flutter/material.dart';

import '../../../../entities/user/user_data.dart';

class Auth extends StatefulWidget {
  const Auth({required this.unauthenticated, required this.authenticated, super.key});

  final Widget unauthenticated;
  final Widget Function(UserData user) authenticated;

  static AuthState of(BuildContext context, {bool listen = false}) {
    AuthState? state;

    if (listen) {
      state = context.dependOnInheritedWidgetOfExactType<_AuthInheritedWidget>()?.state;
    } else {
      state = context.getInheritedWidgetOfExactType<_AuthInheritedWidget>()?.state;
    }

    if (state == null) throw Exception('Invalid context: missing _AuthInheritedWidget');

    return state;
  }

  @override
  State<Auth> createState() => AuthState();
}

class AuthState extends State<Auth> {
  // late final AuthService _service = AppScope.dependenciesOf(context).authService;

  @override
  Widget build(BuildContext context) => _AuthInheritedWidget(
        state: this,
        child: StreamBuilder<UserData?>(
          initialData: null,
          stream: const Stream.empty(),
          builder: (context, snapshot) {
            final user = snapshot.data;

            if (user == null) return widget.unauthenticated;

            return widget.authenticated(user);
          },
        ),
      );
}

class _AuthInheritedWidget extends InheritedWidget {
  const _AuthInheritedWidget({
    required super.child,
    required this.state,
  });

  final AuthState state;

  @override
  bool updateShouldNotify(_AuthInheritedWidget oldWidget) => false;
}
