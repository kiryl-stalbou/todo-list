import '../../../../../entities/todo/todo_data.dart';

abstract interface class TodoRepository {
  Future<void> init();

  Future<void> dispose();

  Future<void> update(List<TodoData> todos);

  Stream<TodoData> get todosStream;
}
