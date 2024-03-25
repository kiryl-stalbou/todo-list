import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

import 'src/logs/logger.dart';
import 'src/logs/widgets_binding_logger.dart';

// dart run build_runner build --delete-conflicting-outputs

void main() async {
  await _initFlutter();

  runApp(TodoApp(uncaughtErrorsController: _initUncaughtErrorsController()));
}

Future<void> _initFlutter() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsBinding.instance.addObserver(const WidgetsBindingLogger());

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

StreamController<void> _initUncaughtErrorsController() {
  const l = Logger(library: 'lib/main.dart', method: '_initUncaughtErrorsController', params: '');

  final controller = StreamController<void>.broadcast();

  WidgetsBinding.instance.platformDispatcher.onError = (error, stack) {
    l.error(error, stack, reason: 'Uncaught Error!!!', fatal: true);

    controller.addError(error, stack);

    return true;
  };

  FlutterError.onError = (details) {
    if (!details.silent) {
      l.flutterError(details, fatal: true);

      controller.addError(details.exception, details.stack);
    }
  };

  return controller;
}
