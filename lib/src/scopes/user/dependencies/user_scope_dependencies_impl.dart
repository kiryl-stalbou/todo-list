import 'package:flutter/material.dart';

import '../../../constants/durations.dart';
import '../../../entities/user/user_data.dart';
import '../../../exceptions/impl/_app_exception.dart';
import '../../../logs/logger.dart';

import '../../../utils/common/initialization_time.dart';
import '../user_scope_status.dart';
import 'user_scope_dependencies.dart';

final class UserScopeDependenciesImpl implements UserScopeDependencies {
  const UserScopeDependenciesImpl._();

  static const _l = Logger(library: 'UserScopeDependenciesImpl');

  static Stream<UserScopeStatus> initializer(BuildContext context, UserData user) async* {
    final l = _l.copyWith(method: 'initializer', params: 'user: $user');

    final watch = Stopwatch()..start();

    try {
      yield const UserScopeInitialization();

      // ---- DEPENDENCIES INITIALIZATION STARTED ----

      // ---- DEPENDENCIES INITIALIZATION FINISHED ----

      await stopInitWatch(AppDurations.minUserScopeInitDelay, watch, l);

      const dependencies = UserScopeDependenciesImpl._();

      yield const UserScopeInitialized(dependencies);

      l.v('Initialization Completed');
    } on AppException catch (e, s) {
      l.error(e, s, reason: 'Initialization Failed');

      await stopInitWatch(AppDurations.minUserScopeInitDelay, watch, l);
    }
  }

  @override
  void dispose() {
    final l = _l.copyWith(method: 'dispose', params: '');

    l.v('Completed');
  }
}
