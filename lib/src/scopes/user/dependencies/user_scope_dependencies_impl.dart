import '../../../constants/durations.dart';
import '../../../entities/user/user_data.dart';
import '../../../exceptions/impl/_app_exception.dart';
import '../../../logs/logger.dart';

import '../../../utils/common/initialization_time.dart';
import '../user_scope_status.dart';
import 'todo/repository/todo_repository.dart';
import 'todo/repository/todo_repository_impl.dart';
import 'todo/service/todo_service.dart';
import 'todo/service/todo_service_impl.dart';
import 'user/service/user_service.dart';
import 'user/service/user_service_impl.dart';
import 'user_scope_dependencies.dart';

final class UserScopeDependenciesImpl implements UserScopeDependencies {
  const UserScopeDependenciesImpl._(this.userService, this.todoService);

  @override
  final UserService userService;

  @override
  final TodoService todoService;

  static const _l = Logger(library: 'UserScopeDependenciesImpl');

  static Stream<UserScopeInitStatus> initializer(UserData user) async* {
    final l = _l.copyWith(method: 'initializer', params: 'user: $user');

    UserService? userService;

    TodoRepository? todoRepository;
    TodoService? todoService;

    final watch = Stopwatch()..start();

    try {
      yield const UserScopeInitActive();

      // ---- DEPENDENCIES INITIALIZATION STARTED ----
      userService = UserServiceImpl(user);

      todoRepository = TodoRepositoryImpl(user.id);
      todoService = TodoServiceImpl(todoRepository);
      // ---- DEPENDENCIES INITIALIZATION FINISHED ----

      final dependencies = UserScopeDependenciesImpl._(userService, todoService);

      await stopInitWatch(AppDurations.minUserScopeInitDelay, watch, l);

      yield UserScopeInitSuccess(dependencies);

      l.v('Initialization Completed');
    } on AppException catch (e, s) {
      l.error(e, s, reason: 'Initialization Failed');

      await todoService?.dispose();
      await todoRepository?.dispose();

      await stopInitWatch(AppDurations.minAppScopeInitDelay, watch, l);

      yield const UserScopeInitFailed();
    }
  }

  @override
  void dispose() {
    final l = _l.copyWith(method: 'dispose', params: '');

    // ignore: discarded_futures
    todoService.dispose();

    l.v('Completed');
  }
}
