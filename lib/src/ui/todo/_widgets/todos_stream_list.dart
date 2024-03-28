import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

import '../../../constants/sizes.dart';
import '../../../entities/todo/todo_data.dart';
import '../../_widgets/common/hide_keyboard_area.dart';
import '../../_widgets/common/spacers.dart';
import '../../_widgets/indicators/circular_loading_indicator.dart';
import 'todo_card.dart';
import 'todos_title.dart';

class TodosStreamList extends StatelessWidget {
  const TodosStreamList({
    required this.title,
    required this.stream,
    super.key,
  });

  final String title;
  final ValueStream<List<TodoData>> stream;

  @override
  Widget build(BuildContext context) => StreamBuilder<List<TodoData>>(
        initialData: stream.valueOrNull,
        stream: stream,
        builder: (_, snapshot) {
          final todos = snapshot.data;

          if (todos == null) {
            return const Center(child: CircularLoadingIndicator(dimension: Indicators.xl));
          }

          return HideKeyboardArea(
            child: CustomScrollView(
              slivers: [
                //
                TodosTitle(title),

                const VSpacer.sliver(Insets.l),

                SliverReorderableList(
                  itemCount: todos.length,
                  itemBuilder: (_, index) => TodoCard(
                    mode: ValueNotifier(TodoCardMode.delete),
                    key: ValueKey(index),
                    todo: todos[index],
                    index: index,
                  ),
                  // itemBuilder: (_, index) => ReorderableDragStartListener(
                  //   key: ValueKey(index),
                  //   index: index,
                  //   child: TodoCard(
                  //     key: ValueKey(index),
                  //     todo: todos[index],
                  //   ),
                  // ),
                  onReorder: (oldIndex, newIndex) {},
                ),

                const VSpacer.sliver(300),
              ],
            ),
          );
        },
      );
}
