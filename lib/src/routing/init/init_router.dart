import 'package:flutter/material.dart';

import '../../ui/_init/init.dart';
import 'init_router_delegate.dart';

class InitRouter extends StatefulWidget {
  const InitRouter({super.key});

  @override
  State<InitRouter> createState() => _InitRouterState();
}

class _InitRouterState extends State<InitRouter> {
  late final _routerDelegate = InitRouterDelegate(
    Init.of(context, listen: true),
  );
  late final _backButtonDispatcher = RootBackButtonDispatcher();

  @override
  Widget build(BuildContext context) => Router(
        routerDelegate: _routerDelegate,
        backButtonDispatcher: _backButtonDispatcher,
      );
}
