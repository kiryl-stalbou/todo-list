import 'package:flutter/material.dart';

import '../../logs/logger.dart';
import 'auth_configuration.dart';

class AuthRouterDelegate extends RouterDelegate<AuthConfiguration> with ChangeNotifier {
  AuthRouterDelegate() : _navigatorKey = GlobalKey();

  final GlobalKey<NavigatorState> _navigatorKey;

  static const _l = Logger(library: 'AuthRouterDelegate');

  @override
  Widget build(BuildContext context) => Navigator(
      key: _navigatorKey,
      onPopPage: _handleNavigatorPop,
      clipBehavior: Clip.none,
      pages: const <Page<void>>[
        //
      ],
    );

  bool _handleNavigatorPop(Route<void> route, void result) {
    if (route.didPop(result)) return _tryPopRoute();

    return false;
  }

  @override
  Future<bool> popRoute() async {
    final navigator = _navigatorKey.currentState;

    if (navigator == null) return false;

    return navigator.maybePop();
  }

  bool _tryPopRoute() => false;

  @override
  Future<void> setInitialRoutePath(AuthConfiguration configuration) async {
    final l = _l.copyWith(method: 'setInitialRoutePath', params: 'configuration: $configuration');

    await setNewRoutePath(configuration);

    l.v('Completed');
  }

  @override
  Future<void> setNewRoutePath(AuthConfiguration configuration) async {
    final l = _l.copyWith(method: 'setNewRoutePath', params: 'configuration: $configuration');

    l.v('Completed');
  }
}
