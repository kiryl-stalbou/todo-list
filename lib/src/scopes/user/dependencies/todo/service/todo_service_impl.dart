import '../../../../../entities/todo/todo_data.dart';
import '../repository/todo_repository.dart';
import 'todo_service.dart';

final class TodoServiceImpl implements TodoService {
  const TodoServiceImpl(this._repository);

  final TodoRepository _repository;

  @override
  Stream<List<TodoData>> get allTodosStream => throw UnimplementedError();

  @override
  Stream<List<TodoData>> get completedTodosStream => throw UnimplementedError();

  @override
  Stream<List<TodoData>> get todayTodosStream => throw UnimplementedError();

  @override
  void create(TodoData todo) {}

  @override
  void delete(TodoData todo) {}

  @override
  Future<void> dispose() async {}

  @override
  Future<void> init() async {}

  @override
  void sort<T>(TodosSortComparator<T> comparator) {}

  @override
  void update(TodoData todo) {}
}
