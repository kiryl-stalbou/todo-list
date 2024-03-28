import 'package:flutter/material.dart';

import '../../../entities/todo/todo_data.dart';
import '../../../l10n/lk.dart';
import '../../../l10n/s.dart';
import '../../../scopes/user/dependencies/todos/todos.dart';
import '../../../utils/common/unique_id.dart';
import '../../_widgets/appbars/scroll_aware_appbar.dart';
import '../../_widgets/scaffolds/app_scaffold.dart';
import '../_widgets/todo_card.dart';
import '../_widgets/todos_menu.dart';
import '../_widgets/todos_stream.dart';

class TodayTodosScreen extends StatefulWidget {
  const TodayTodosScreen({super.key});

  @override
  State<TodayTodosScreen> createState() => _TodayTodosScreenState();
}

class _TodayTodosScreenState extends State<TodayTodosScreen> {
  final _todosCardsMode = ValueNotifier<TodoCardMode?>(null);

  void _onAddTodoTap() => Todos.of(context).create(
        TodoData(
          id: generateUniqueId(),
          title: null,
          notes: null,
          date: DateTime.now(),
          isCompleted: false,
        ),
      );

  @override
  void dispose() {
    _todosCardsMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return AppScaffold(
      top: ScrollAwareAppBar(
        title: Text(s.key(Lk.today)),
        showTitleScrollExtent: 25,
        actions: [
          TodosMenu(
            mode: _todosCardsMode,
            onAddTodoTap: _onAddTodoTap,
          ),
        ],
      ),
      body: TodosStream(
        mode: _todosCardsMode,
        title: s.key(Lk.today),
        stream: Todos.of(context).todayTodosStream,
      ),
    );
  }
}
