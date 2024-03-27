import 'todo/service/todo_service.dart';
import 'user/service/user_service.dart';

/// Dirty class that initialize all user scope dependencies.
abstract interface class UserScopeDependencies {
  UserService get userService;

  TodoService get todoService;
  
  /// Dispose all [UserScopeDependencies]
  void dispose();
}
