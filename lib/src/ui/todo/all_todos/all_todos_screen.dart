import 'package:flutter/material.dart';

import '../../../l10n/lk.dart';
import '../../../l10n/s.dart';
import '../../../scopes/user/dependencies/todos/todos.dart';
import '../../_widgets/appbars/scroll_aware_appbar.dart';
import '../../_widgets/scaffolds/app_scaffold.dart';
import '../_widgets/todo_add_button.dart';
import '../_widgets/todos_stream_list.dart';

class AllTodosScreen extends StatelessWidget {
  const AllTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return AppScaffold(
      top: ScrollAwareAppBar(
        showTitleScrollExtent: 40,
        title: Text(s.key(Lk.all)),
        actions: const [TodoAddButton.all()],
      ),
      body: TodosStreamList(
        title: s.key(Lk.all),
        stream: Todos.of(context).allTodosStream,
      ),
    );
  }
}
