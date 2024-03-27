import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../entities/todo/todo_data.dart';
import '../../../l10n/lk.dart';
import '../../../l10n/s.dart';
import '../../_widgets/animated/sliver_auto_animated_list.dart';
import '../../_widgets/appbars/scroll_aware_appbar.dart';
import '../../_widgets/common/hide_keyboard_area.dart';
import '../../_widgets/common/spacers.dart';
import '../../_widgets/scaffolds/app_scaffold.dart';
import '../_widgets/tab_title.dart';
import '../_widgets/todo_add_button.dart';
import '../_widgets/todo_card.dart';

class AllTodosScreen extends StatelessWidget {
  const AllTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return AppScaffold(
      top: ScrollAwareAppBar(
        showTitleScrollExtent: 40,
        title: Text(s.key(Lk.all)),
        actions: const [TodoAddButton()],
      ),
      body: Material(
        type: MaterialType.transparency,
        child: HideKeyboardArea(
          child: CustomScrollView(
            slivers: [
              //
              TabTitle(s.key(Lk.all)),

              const VSpacer.sliver(Insets.l),

              SliverAutoAnimatedList<TodoData>(
                builder: (index, item) => TodoCard(todo: item),
                items: const [
                  TodoData(title: null, notes: null, dateTime: null, isCompleted: false),
                  TodoData(title: null, notes: null, dateTime: null, isCompleted: false),
                  TodoData(title: null, notes: null, dateTime: null, isCompleted: false),
                  TodoData(title: null, notes: null, dateTime: null, isCompleted: false),
                  TodoData(title: null, notes: null, dateTime: null, isCompleted: false),
                  TodoData(title: null, notes: null, dateTime: null, isCompleted: false),
                  TodoData(title: null, notes: null, dateTime: null, isCompleted: false),
                  TodoData(title: null, notes: null, dateTime: null, isCompleted: false),
                ],
              ),

              const VSpacer.sliver(300),
            ],
          ),
        ),
      ),
    );
  }
}
