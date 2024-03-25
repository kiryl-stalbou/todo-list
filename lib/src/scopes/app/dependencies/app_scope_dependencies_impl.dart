import 'package:flutter/widgets.dart';

import '../../../constants/durations.dart';
import '../../../exceptions/impl/_app_exception.dart';
import '../../../logs/logger.dart';

import '../../../utils/common/initialization_time.dart';
import '../app_scope_status.dart';
import 'app_scope_dependencies.dart';

final class AppScopeDependenciesImpl implements AppScopeDependencies {
  const AppScopeDependenciesImpl._();

  static const _l = Logger(library: 'AppScopeDependenciesImpl');

  static Stream<AppScopeStatus> initializer(BuildContext context) async* {
    final l = _l.copyWith(method: 'initializer', params: '');

    final watch = Stopwatch()..start();

    try {
      yield const AppScopeInitialization();

      // ---- DEPENDENCIES INITIALIZATION STARTED ----

      // ---- DEPENDENCIES INITIALIZATION FINISHED ----

      await stopInitWatch(AppDurations.minAppScopeInitDelay, watch, l);

      const dependencies = AppScopeDependenciesImpl._();

      yield const AppScopeInitialized(dependencies);

      l.v('Initialization Completed');
    } on AppException catch (e, s) {
      l.error(e, s, reason: 'Initialization Failed');

      await stopInitWatch(AppDurations.minAppScopeInitDelay, watch, l);
    }
  }

  @override
  void dispose() {
    final l = _l.copyWith(method: 'dispose', params: '');

    l.v('Completed');
  }
}
