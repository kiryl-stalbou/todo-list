import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../../../entities/todo/todo_data.dart';
import '../../../../../exceptions/impl/todo_exception.dart';
import '../../../../../logs/logger.dart';
import '../repository/todos_repository.dart';
import 'todos_service.dart';

final class TodosServiceImpl implements TodosService {
  TodosServiceImpl(this._repository);

  final TodosRepository _repository;

  static const _l = Logger(library: 'TodosServiceImpl');

  final _completedTodosController = BehaviorSubject<List<TodoData>>();
  final _todayTodosController = BehaviorSubject<List<TodoData>>();
  final _allTodosController = BehaviorSubject<List<TodoData>>();
  late final StreamSubscription<List<TodoData>> _todosSubscription;

  @override
  ValueStream<List<TodoData>> get allTodosStream => _repository.todosStream;

  @override
  ValueStream<List<TodoData>> get completedTodosStream => _completedTodosController.stream;

  @override
  ValueStream<List<TodoData>> get todayTodosStream => _todayTodosController.stream;

  @override
  Future<void> init() async {
    final l = _l.copyWith(method: 'init', params: '');

    _todosSubscription = _repository.todosStream.listen(_onTodosChanges);

    l.v('Completed');
  }

  @override
  Future<void> dispose() async {
    final l = _l.copyWith(method: 'dispose', params: '');

    await _todosSubscription.cancel();
    await _completedTodosController.close();
    await _todayTodosController.close();
    await _allTodosController.close();

    l.v('Completed');
  }

  @override
  void create(TodoData todo) {
    final l = _l.copyWith(method: 'create', params: 'todo: $todo');

    final todos = _repository.todosStream.valueOrNull;

    if (todos == null) {
      l.w('Failed to create todo, last emited todos not found');
      return;
    }

    todos.add(todo);

    // ignore: discarded_futures
    _update(todos);

    l.v('Completed');
  }

  @override
  void delete(TodoData todo) {
    final l = _l.copyWith(method: 'delete', params: 'todo: $todo');

    final todos = _repository.todosStream.valueOrNull;

    if (todos == null) {
      l.w('Failed to delete todo, last emited todos not found');
      return;
    }

    final isRemoved = todos.remove(todo);

    if (!isRemoved) {
      l.w('Failed to delete todo, target todo not found');
      return;
    }

    // ignore: discarded_futures
    _update(todos);

    l.v('Delete was successfull');
  }

  @override
  void update(TodoData oldTodo, TodoData newTodo, int? newIndex) {
    final l = _l.copyWith(method: 'update', params: 'oldTodo: $oldTodo, newTodo: $newTodo');

    final todos = _repository.todosStream.valueOrNull;

    if (todos == null) {
      l.w('Failed to update todo, last emited todos not found');
      return;
    }

    final oldIndex = todos.indexOf(oldTodo);

    if (oldIndex == -1) {
      l.w('Failed to update todo, oldTodo not found');
      return;
    }

    if (newIndex == null) {
      todos[oldIndex] = newTodo;
    } else {
      todos
        ..removeAt(oldIndex)
        ..insert(newIndex, newTodo);
    }

    // ignore: discarded_futures
    _update(todos);

    l.v('Update was successfull');
  }

  @override
  void sort<T>(TodosSortComparator<T> comparator) {
    final l = _l.copyWith(method: 'sort', params: 'comparator: $comparator');

    l.v('Completed');
  }

  Future<void> _update(List<TodoData> todos) async {
    final l = _l.copyWith(method: '_updatePersistence', params: '');
    try {
      _onTodosChanges(todos);

      await _repository.update(todos);

      l.v('Completed');
    } on TodoException catch (e, s) {
      l.error(e, s, reason: 'Failed to update todos persistence');
      // Since firebase automatically will retry next time when user goes online
      // we dont need to manage this scenario, so we just silence this exception
    }
  }

  void _onTodosChanges(List<TodoData> todos) {
    final l = _l.copyWith(method: '_onTodosChanges', params: 'todos: $todos');

    final todayTodos = <TodoData>[];
    final completedTodos = <TodoData>[];

    for (final todo in todos) {
      if (todo.isCompleted) {
        completedTodos.add(todo);
      } else if (_isToday(todo.dateTime)) {
        todayTodos.add(todo);
      }
    }

    _allTodosController.add(todos);
    _todayTodosController.add(todayTodos);
    _completedTodosController.add(completedTodos);

    l.v('Completed with today: $todayTodos, completed: $completedTodos');
  }
}

bool _isToday(DateTime? date) {
  if (date == null) return false;
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final shortDate = DateTime(date.year, date.month, date.day);
  return shortDate.isAtSameMomentAs(today);
}
