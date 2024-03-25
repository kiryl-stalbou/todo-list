import 'package:flutter/material.dart';

import '../../logs/logger.dart';

import 'todo_configuration.dart';

class TodoRouteInformationParser extends RouteInformationParser<TodoConfiguration> {
  static const _l = Logger(library: 'TodoRouteInformationParser');

  @override
  Future<TodoConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    final l = _l.copyWith(method: 'parseRouteInformation', params: 'routeInformation: ${routeInformation.uri}');

    final configuration = TodoConfiguration.fromUri(routeInformation.uri);

    l.v('Completed with: $configuration');

    return configuration;
  }
}
