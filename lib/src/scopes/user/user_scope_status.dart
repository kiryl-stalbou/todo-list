import 'dependencies/user_scope_dependencies.dart';

/// States of user scope initialization flow.
sealed class UserScopeStatus {}

final class UserScopeInitialization implements UserScopeStatus {
  const UserScopeInitialization();
}

final class UserScopeInitialized implements UserScopeStatus {
  const UserScopeInitialized(this.dependencies);

  final UserScopeDependencies dependencies;
}
