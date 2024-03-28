import 'package:rxdart/rxdart.dart';

import '../../../../../entities/todo/todo_data.dart';

abstract interface class TodosService {
  Future<void> init();

  Future<void> dispose();

  void create(TodoData todo);

  void update(TodoData oldTodo, TodoData newTodo, int? newIndex);

  void delete(TodoData todo);

  void sort<T>(TodosSortComparator<T> comparator);

  ValueStream<List<TodoData>> get allTodosStream;

  ValueStream<List<TodoData>> get todayTodosStream;

  ValueStream<List<TodoData>> get completedTodosStream;
}

sealed class TodosSortComparator<T> {
  const TodosSortComparator(this.comparator);

  final Comparator<T> comparator;
}

final class TodayTodosSortComparator<T> extends TodosSortComparator<T> {
  TodayTodosSortComparator(super.comparator);
}

final class CompletedTodosSortComparator<T> extends TodosSortComparator<T> {
  CompletedTodosSortComparator(super.comparator);
}
