import 'package:flutter/material.dart';

import '../../ui/_init/init.dart';
import '../../ui/_init/states/scope_init_active_screen.dart';
import '../../ui/_init/states/scope_init_failed_screen.dart';
import '../_pages/no_transition_page.dart';

class InitRouterDelegate extends RouterDelegate<void> with ChangeNotifier {
  InitRouterDelegate(this._initState);

  final InitState _initState;

  @override
  Future<bool> popRoute() async => false;

  @override
  Future<void> setNewRoutePath(void configuration) async {}

  @override
  Widget build(BuildContext context) {
    final showScopeInitFailedScreen = _initState.showScopeInitFailedScreen;

    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      clipBehavior: Clip.none,
      pages: <Page<void>>[
        //
        asNoTransitionPage(const ScopeInitActiveScreen(), 'AppScopeInitScreen'),

        if (showScopeInitFailedScreen) asNoTransitionPage(const ScopeInitFailedScreen(), 'ScopeInitFailedScreen'),
      ],
    );
  }
}
