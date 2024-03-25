import 'dart:async';

import 'package:flutter/material.dart';

import '../../entities/user/user_data.dart';
import '../../ui/_init/init.dart';
import 'dependencies/user_scope_dependencies.dart';
import 'dependencies/user_scope_dependencies_impl.dart';
import 'dependencies/user_scope_dependencies_tree.dart';
import 'user_scope_status.dart';

class UserScope extends StatefulWidget {
  UserScope({
    required this.user,
    required this.initialization,
    required this.initialized,
  }) : super(key: ValueKey(user));

  final UserData user;
  final Widget initialization;
  final Widget initialized;

  static UserScopeDependencies dependenciesOf(BuildContext context) {
    final dependencies = context.getInheritedWidgetOfExactType<_UserScopeInheritedWidget>()?.dependencies;

    if (dependencies == null) throw Exception('Invalid context: missing _userScopeInheritedWidget');

    return dependencies;
  }

  @override
  State<UserScope> createState() => _UserScopeState();
}

class _UserScopeState extends State<UserScope> {
  late Stream<UserScopeStatus> _dependenciesInitializer;
  UserScopeDependencies? _dependencies;

  void _resolveDependenciesInitializer() {
    _dependenciesInitializer = UserScopeDependenciesImpl.initializer(context, widget.user);
  }

  @override
  void initState() {
    super.initState();
    _resolveDependenciesInitializer();
    
    Init.of(context).onScopeInitReload = () => setState(_resolveDependenciesInitializer);
  }

  @override
  void dispose() {
    _dependencies?.dispose();
    super.dispose();
  }

  Widget _initialized(UserScopeDependencies dependencies) {
    _dependencies = dependencies;

    return _UserScopeInheritedWidget(
      dependencies: dependencies,
      child: UserScopeDependenciesTree(
        child: widget.initialized,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<UserScopeStatus>(
        stream: _dependenciesInitializer,
        initialData: const UserScopeInitialization(),
        builder: (context, snapshot) => switch (snapshot.requireData) {
          UserScopeInitialization() => widget.initialization,
          UserScopeInitialized(:final dependencies) => _initialized(dependencies),
        },
      );
}

class _UserScopeInheritedWidget extends InheritedWidget {
  const _UserScopeInheritedWidget({
    required this.dependencies,
    required super.child,
  });

  final UserScopeDependencies dependencies;

  @override
  bool updateShouldNotify(_UserScopeInheritedWidget oldWidget) => false;
}
