import 'user/service/user_service.dart';

/// Dirty class that initialize all user scope dependencies.
abstract interface class UserScopeDependencies {
  UserService get userService;
  
  /// Dispose all [UserScopeDependencies]
  void dispose();
}
