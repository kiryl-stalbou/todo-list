import '../../../entities/user/user_data.dart';
import '../../../exceptions/impl/_app_exception.dart';
import '../../../logs/logger.dart';

import '../user_scope_status.dart';
import 'user/service/user_service.dart';
import 'user/service/user_service_impl.dart';
import 'user_scope_dependencies.dart';

final class UserScopeDependenciesImpl implements UserScopeDependencies {
  const UserScopeDependenciesImpl._(this.userService);

  @override
  final UserService userService;

  static const _l = Logger(library: 'UserScopeDependenciesImpl');

  static Stream<UserScopeInitStatus> initializer(UserData user) async* {
    final l = _l.copyWith(method: 'initializer', params: 'user: $user');

    UserService? userService;

    try {
      yield const UserScopeInitActive();

      // ---- DEPENDENCIES INITIALIZATION STARTED ----
      userService = UserServiceImpl(user);
      // ---- DEPENDENCIES INITIALIZATION FINISHED ----

      final dependencies = UserScopeDependenciesImpl._(userService);

      yield UserScopeInitSuccess(dependencies);

      l.v('Initialization Completed');
    } on AppException catch (e, s) {
      l.error(e, s, reason: 'Initialization Failed');

      yield const UserScopeInitFailed();
    }
  }

  @override
  void dispose() {
    final l = _l.copyWith(method: 'dispose', params: '');

    l.v('Completed');
  }
}
