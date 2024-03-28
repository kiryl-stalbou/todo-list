import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../entities/todo/todo_data.dart';

import '../../../../utils/common/debouncer.dart';
import '../../user_scope.dart';
import 'service/todos_service.dart';

class Todos extends StatefulWidget {
  const Todos({required this.child, super.key});

  final Widget child;

  static TodosState of(BuildContext context) {
    final state = context.getInheritedWidgetOfExactType<_TodoScope>()?.state;

    if (state == null) throw Exception('Invalid context: missing _TodoScope');

    return state;
  }

  @override
  State<Todos> createState() => TodosState();
}

class TodosState extends State<Todos> {
  late final TodosService _service = UserScope.dependenciesOf(context).todosService;
  late final _d = Debouncer(duration: const Duration(seconds: 1));

  void create(TodoData todo) => _service.create(todo);

  void update(TodoData oldTodo, TodoData newTodo, {int? newIndex, bool debounce = false}) {
    if (debounce) {
      _d.run(() => _service.update(oldTodo, newTodo, newIndex));
    } else {
      _service.update(oldTodo, newTodo, newIndex);
    }
  }

  void delete(TodoData todo) => _service.delete(todo);

  void sort<T>(TodosSortComparator<T> comparator) => _service.sort(comparator);

  ValueStream<List<TodoData>> get allTodosStream => _service.allTodosStream;

  ValueStream<List<TodoData>> get todayTodosStream => _service.todayTodosStream;

  ValueStream<List<TodoData>> get completedTodosStream => _service.completedTodosStream;

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

  final TodosState state;

  @override
  bool updateShouldNotify(_TodoScope oldWidget) => false;
}
