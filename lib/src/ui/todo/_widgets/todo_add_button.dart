import 'package:flutter/material.dart';

import '../../../entities/todo/todo_data.dart';
import '../../../l10n/lk.dart';
import '../../../l10n/s.dart';
import '../../../scopes/user/dependencies/todos/todos.dart';

class TodoAddButton extends StatelessWidget {
  const TodoAddButton({required this.template, super.key});
  const TodoAddButton.all({super.key}) : template = const TodoData(title: null, notes: null, dateTime: null, isCompleted: false);
  TodoAddButton.today({super.key}) : template = TodoData(title: null, notes: null, dateTime: DateTime.now(), isCompleted: false);

  final TodoData template;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => Todos.of(context).create(template),
        tooltip: S.of(context).key(Lk.addTodo),
        icon: const Icon(Icons.add),
      );
}
