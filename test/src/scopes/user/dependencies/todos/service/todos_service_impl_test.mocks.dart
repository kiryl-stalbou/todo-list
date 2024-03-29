import 'package:rxdart/rxdart.dart';
import 'package:todo_app_krainet/src/entities/todo/todo_data.dart';
import 'package:todo_app_krainet/src/scopes/user/dependencies/todos/repository/todos_repository.dart';

final class MockTodosRepository implements TodosRepository {
  List<TodoData> _todos = [];

  final _todosStreamController = BehaviorSubject<List<TodoData>>();

  @override
  Future<void> dispose() => _todosStreamController.close();

  @override
  Future<void> init() async => _todosStreamController.add(_todos);

  @override
  ValueStream<List<TodoData>> get todosStream => _todosStreamController.stream;

  @override
  Future<void> update(List<TodoData> todos) async {
    _todos = todos;
    _todosStreamController.add(_todos);
  }
}
