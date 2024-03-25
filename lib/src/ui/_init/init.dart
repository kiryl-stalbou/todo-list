import 'package:flutter/material.dart';

class Init extends StatefulWidget {
  const Init({required this.child, super.key});

  final Widget child;

  static InitState of(BuildContext context, {bool listen = false}) {
    InitState? state;

    if (listen) {
      state = context.dependOnInheritedWidgetOfExactType<_InitInheritedWidget>()?.state;
    } else {
      state = context.getInheritedWidgetOfExactType<_InitInheritedWidget>()?.state;
    }

    if (state == null) throw Exception('Invalid context: missing _InitInheritedWidget');

    return state;
  }

  @override
  State<Init> createState() => InitState();
}

class InitState extends State<Init> {
  set showScopeInitFailedScreen(bool val) => setState(() => _showScopeInitErrorScreen = val);
  bool get showScopeInitFailedScreen => _showScopeInitErrorScreen;
  bool _showScopeInitErrorScreen = false;

  VoidCallback? onScopeInitReload;

  @override
  Widget build(BuildContext context) => _InitInheritedWidget(
        state: this,
        showScopeInitErrorScreen: showScopeInitFailedScreen,
        child: widget.child,
      );
}

class _InitInheritedWidget extends InheritedWidget {
  const _InitInheritedWidget({
    required this.state,
    required this.showScopeInitErrorScreen,
    required super.child,
  });

  final InitState state;
  final bool showScopeInitErrorScreen;

  @override
  bool updateShouldNotify(_InitInheritedWidget oldWidget) => oldWidget.showScopeInitErrorScreen != showScopeInitErrorScreen;
}
