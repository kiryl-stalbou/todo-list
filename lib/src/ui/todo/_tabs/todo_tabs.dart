import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'states/desktop_todo_tabs.dart';
import 'states/mobile_todo_tabs.dart';

class TodoTabs extends StatefulWidget {
  const TodoTabs({super.key});

  static TodoTabsState of(BuildContext context) {
    final state = context.dependOnInheritedWidgetOfExactType<_TodoTabsInheritedWidget>()?.state;

    if (state == null) throw Exception('Invalid context: Missing _TodoTabsInheritedWidget');

    return state;
  }

  @override
  State<TodoTabs> createState() => TodoTabsState();
}

class TodoTabsState extends State<TodoTabs> {
  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;
  set selectedTabIndex(int index) => setState(() => _selectedTabIndex = index);

  @override
  Widget build(BuildContext context) => _TodoTabsInheritedWidget(
        selectedTabIndex: _selectedTabIndex,
        state: this,
        child: !kIsWeb
            ? const MobileTodoTabs()
            : LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 600) {
                    return const MobileTodoTabs();
                  }

                  return const DesktopTodoTabs();
                },
              ),
      );
}

class _TodoTabsInheritedWidget extends InheritedWidget {
  const _TodoTabsInheritedWidget({
    required this.selectedTabIndex,
    required this.state,
    required super.child,
  });

  final TodoTabsState state;
  final int selectedTabIndex;

  @override
  bool updateShouldNotify(_TodoTabsInheritedWidget oldWidget) => oldWidget.selectedTabIndex != selectedTabIndex;
}
