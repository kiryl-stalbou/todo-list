import 'package:flutter/material.dart';

import '../../../constants/durations.dart';
import '../../../entities/user/user_data.dart';
import '../../../exceptions/impl/_app_exception.dart';
import '../../../logs/logger.dart';

import '../../../ui/_init/init.dart';
import '../../../utils/common/initialization_time.dart';
import '../user_scope_status.dart';
import 'user/service/user_service.dart';
import 'user/service/user_service_impl.dart';
import 'user_scope_dependencies.dart';

final class UserScopeDependenciesImpl implements UserScopeDependencies {
  const UserScopeDependenciesImpl._(this.userService);

  final UserService userService;

  static const _l = Logger(library: 'UserScopeDependenciesImpl');

  static Stream<UserScopeStatus> initializer(BuildContext context, UserData user) async* {
    final l = _l.copyWith(method: 'initializer', params: 'user: $user');

    final initState = Init.of(context)..showScopeInitFailedScreen = false;

    UserService? userService;

    final watch = Stopwatch()..start();

    try {
      yield const UserScopeInitialization();

      // ---- DEPENDENCIES INITIALIZATION STARTED ----
      userService = UserServiceImpl(user);
      // ---- DEPENDENCIES INITIALIZATION FINISHED ----

      await stopInitWatch(AppDurations.minUserScopeInitDelay, watch, l);

      final dependencies = UserScopeDependenciesImpl._(userService);

      yield UserScopeInitialized(dependencies);

      l.v('Initialization Completed');
    } on AppException catch (e, s) {
      l.error(e, s, reason: 'Initialization Failed');

      initState.showScopeInitFailedScreen = true;

      await stopInitWatch(AppDurations.minUserScopeInitDelay, watch, l);
    }
  }

  @override
  void dispose() {
    final l = _l.copyWith(method: 'dispose', params: '');

    l.v('Completed');
  }
}
