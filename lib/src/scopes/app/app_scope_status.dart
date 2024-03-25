import 'dependencies/app_scope_dependencies.dart';

/// States of app scope initialization flow.
sealed class AppScopeStatus {}

final class AppScopeInitialization implements AppScopeStatus {
  const AppScopeInitialization();
}

final class AppScopeInitialized implements AppScopeStatus {
  const AppScopeInitialized(this.dependencies);

  final AppScopeDependencies dependencies;
}
