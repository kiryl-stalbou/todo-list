import '../../../../../entities/todo/todo_data.dart';
import 'todo_repository.dart';

final class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl(this._uid);

  final String _uid;

  @override
  Stream<TodoData> get todosStream => throw UnimplementedError();

  @override
  Future<void> init() async {}

  @override
  Future<void> dispose() async {}

  @override
  Future<void> update(List<TodoData> todos) async {}
}
