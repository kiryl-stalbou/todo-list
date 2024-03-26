import '../../../exceptions/impl/_app_exception.dart';
import '../../../logs/logger.dart';

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

  static Stream<AppScopeInitStatus> initializer() async* {
    final l = _l.copyWith(method: 'initializer', params: '');

    AuthService? authService;
    AuthRepository? authRepository;

    try {
      yield const AppScopeInitActive();

      // ---- DEPENDENCIES INITIALIZATION STARTED ----
      authRepository = AuthRepositoryImpl();
      await authRepository.init();
      authService = AuthServiceImpl(authRepository);
      // ---- DEPENDENCIES INITIALIZATION FINISHED ----

      final dependencies = AppScopeDependenciesImpl._(authService);

      yield AppScopeInitSuccess(dependencies);

      l.v('Initialization Completed');
    } on AppException catch (e, s) {
      l.error(e, s, reason: 'Initialization Failed');

      authService?.dispose();
      authRepository?.dispose();

      yield const AppScopeInitFailed();
    }
  }

  @override
  void dispose() {
    final l = _l.copyWith(method: 'dispose', params: '');

    authService.dispose();

    l.v('Completed');
  }
}
