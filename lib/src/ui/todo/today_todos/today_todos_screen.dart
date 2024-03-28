import 'package:flutter/material.dart';

import '../../../l10n/lk.dart';
import '../../../l10n/s.dart';
import '../../../scopes/user/dependencies/todos/todos.dart';
import '../../_widgets/appbars/scroll_aware_appbar.dart';
import '../../_widgets/scaffolds/app_scaffold.dart';
import '../_widgets/todo_add_button.dart';
import '../_widgets/todos_stream_list.dart';

class TodayTodosScreen extends StatelessWidget {
  const TodayTodosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return AppScaffold(
      top: ScrollAwareAppBar(
        title: Text(s.key(Lk.today)),
        showTitleScrollExtent: 40,
        actions: [TodoAddButton.today()],
      ),
      body: TodosStreamList(
        title: s.key(Lk.today),
        stream: Todos.of(context).todayTodosStream,
      ),
    );
  }
}
