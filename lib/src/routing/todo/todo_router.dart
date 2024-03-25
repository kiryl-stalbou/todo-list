import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'todo_route_information_parser.dart';
import 'todo_router_delegate.dart';

class TodoRouter extends StatefulWidget {
  const TodoRouter({super.key});

  @override
  State<TodoRouter> createState() => _TodoRouterState();
}

class _TodoRouterState extends State<TodoRouter> {
  late final _routerDelegate = TodoRouterDelegate();
  late final _routeInformationParser = TodoRouteInformationParser();
  late final _routeInformationProvider = PlatformRouteInformationProvider(
    initialRouteInformation: RouteInformation(uri: Uri.tryParse('/')),
  );
  late final _backButtonDispatcher = RootBackButtonDispatcher();

  @override
  Widget build(BuildContext context) => Router(
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
        routeInformationProvider: _routeInformationProvider,
        backButtonDispatcher: _backButtonDispatcher,
      );
}
