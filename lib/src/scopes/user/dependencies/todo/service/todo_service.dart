import '../../../../../entities/todo/todo_data.dart';

abstract interface class TodoService {
  Future<void> init();

  Future<void> dispose();

  void create(TodoData todo);

  void update(TodoData todo);

  void delete(TodoData todo);

  void sort<T>(TodosSortComparator<T> comparator);

  Stream<List<TodoData>> get allTodosStream;

  Stream<List<TodoData>> get todayTodosStream;

  Stream<List<TodoData>> get completedTodosStream;
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
