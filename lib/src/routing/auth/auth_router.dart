import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../scopes/app/dependencies/auth/auth.dart';
import 'auth_route_information_parser.dart';
import 'auth_router_delegate.dart';

class AuthRouter extends StatefulWidget {
  const AuthRouter({super.key});

  @override
  State<AuthRouter> createState() => _AuthRouterState();
}

class _AuthRouterState extends State<AuthRouter> {
  late final _routerDelegate = AuthRouterDelegate(
    Auth.of(context, listen: true),
  );
  late final _routeInformationParser = AuthRouteInformationParser();
  late final _routeInformationProvider = PlatformRouteInformationProvider(
    initialRouteInformation: RouteInformation(uri: Uri.parse('/')),
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
