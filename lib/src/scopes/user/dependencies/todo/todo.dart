import 'package:flutter/material.dart';

import '../../../../entities/todo/todo_data.dart';

import '../../user_scope.dart';
import 'service/todo_service.dart';

class Todo extends StatefulWidget {
  const Todo({required this.child, super.key});

  final Widget child;

  static TodoState of(BuildContext context) {
    final state = context.getInheritedWidgetOfExactType<_TodoScope>()?.state;

    if (state == null) throw Exception('Invalid context: missing _TodoScope');

    return state;
  }

  @override
  State<Todo> createState() => TodoState();
}

class TodoState extends State<Todo> {
  late final TodoService _service = UserScope.dependenciesOf(context).todoService;

  void create(TodoData todo) => _service.create(todo);

  void update(TodoData todo) => _service.update(todo);

  void delete(TodoData todo) => _service.delete(todo);

  void sort<T>(TodosSortComparator<T> comparator) => _service.sort(comparator);

  Stream<List<TodoData>> get allTodosStream => _service.allTodosStream;

  Stream<List<TodoData>> get todayTodosStream => _service.allTodosStream;

  Stream<List<TodoData>> get completedTodosStream => _service.allTodosStream;

  @override
  Widget build(BuildContext context) => _TodoScope(
        state: this,
        child: widget.child,
      );
}

class _TodoScope extends InheritedWidget {
  const _TodoScope({
    required this.state,
    required super.child,
  });

  final TodoState state;

  @override
  bool updateShouldNotify(_TodoScope oldWidget) => false;
}
