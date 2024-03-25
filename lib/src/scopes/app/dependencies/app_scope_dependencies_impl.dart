import 'package:flutter/widgets.dart';

import '../../../constants/durations.dart';
import '../../../exceptions/impl/_app_exception.dart';
import '../../../logs/logger.dart';

import '../../../utils/common/initialization_time.dart';
import '../app_scope_status.dart';
import 'app_scope_dependencies.dart';
import 'auth/repository/auth_repository.dart';
import 'auth/repository/auth_repository_impl.dart';
import 'auth/service/auth_service.dart';
import 'auth/service/auth_service_impl.dart';

final class AppScopeDependenciesImpl implements AppScopeDependencies {
  const AppScopeDependenciesImpl._(this.authService);

  @override
  final AuthService authService;

  static const _l = Logger(library: 'AppScopeDependenciesImpl');

  static Stream<AppScopeStatus> initializer(BuildContext context) async* {
    final l = _l.copyWith(method: 'initializer', params: '');

    final watch = Stopwatch()..start();

    AuthService? authService;
    AuthRepository? authRepository;

    try {
      yield const AppScopeInitialization();

      // ---- DEPENDENCIES INITIALIZATION STARTED ----
      authRepository = AuthRepositoryImpl();
      await authRepository.init();
      authService = AuthServiceImpl(authRepository);
      // ---- DEPENDENCIES INITIALIZATION FINISHED ----

      await stopInitWatch(AppDurations.minAppScopeInitDelay, watch, l);

      final dependencies = AppScopeDependenciesImpl._(authService);

      yield AppScopeInitialized(dependencies);

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
