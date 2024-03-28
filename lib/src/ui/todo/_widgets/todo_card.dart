import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/sizes.dart';
import '../../../entities/todo/todo_data.dart';
import '../../../l10n/lk.dart';
import '../../../l10n/s.dart';
import '../../../scopes/user/dependencies/todos/todos.dart';
import '../../../utils/common/hide_scrollbar.dart';
import '../../../utils/mixins/ensure_visible.dart';
import '../../_widgets/common/spacers.dart';

enum TodoCardMode { drag, delete }

class TodoCard extends StatefulWidget {
  const TodoCard({
    required this.index,
    required this.todo,
    required this.mode,
    super.key,
  });

  final int index;
  final TodoData todo;
  final ValueNotifier<TodoCardMode?> mode;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  late final _isCompleted = ValueNotifier(widget.todo.isCompleted);

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: const HideScrollbarBehavior(),
        child: Material(
          type: MaterialType.transparency,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              //
              _CompleteToggle(widget.todo, _isCompleted),

              Expanded(child: _Info(widget.todo, _isCompleted)),

              _ActionButton(widget.todo, widget.index, widget.mode),

              // Makes sure that web scroll bar doesn't overlap components
              if (kIsWeb) const HSpacer(Insets.l),
            ],
          ),
        ),
      );
}

class _CompleteToggle extends StatelessWidget {
  const _CompleteToggle(this.todo, this.isCompleted);

  final TodoData todo;
  final ValueNotifier<bool> isCompleted;

  void _onChanged(BuildContext context, bool? value) {
    isCompleted.value = value ?? false;
    // ignore: discarded_futures
    HapticFeedback.selectionClick();

    // Todos.of(context).update(todo, todo.copyWith(isCompleted: true), debounce: true);
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.xs),
        child: Transform.scale(
          scale: 1.2,
          child: ListenableBuilder(
            listenable: isCompleted,
            builder: (_, __) => Checkbox(
              value: isCompleted.value,
              onChanged: (value) => _onChanged(context, value),
            ),
          ),
        ),
      );
}

class _Info extends StatefulWidget {
  const _Info(this.todo, this.isCompleted);

  final TodoData todo;
  final ValueNotifier<bool> isCompleted;

  @override
  State<_Info> createState() => _InfoState();
}

class _InfoState extends State<_Info> with AutomaticKeepAliveClientMixin {
  late final _titleController = TextEditingController(text: widget.todo.title);
  late final _notesController = TextEditingController(text: widget.todo.title);

  void _onChanged(String text) => Todos.of(context).update(
        widget.todo,
        widget.todo.copyWith(title: _titleController.text, notes: _notesController.text),
        debounce: true,
      );

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //
        const VSpacer(Insets.xs),

        TextField(
          minLines: 1,
          maxLines: 3,
          onChanged: _onChanged,
          controller: _titleController,
          keyboardType: TextInputType.multiline,
          onTap: () async => ensureTextFieldVisible(context),
          decoration: InputDecoration.collapsed(
            hintText: s.key(Lk.title),
            hintStyle: textTheme.labelMedium?.copyWith(color: colorScheme.tertiary),
          ),
          style: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
        ),

        const VSpacer(Insets.s),

        TextField(
          minLines: 1,
          maxLines: 6,
          onChanged: _onChanged,
          controller: _notesController,
          keyboardType: TextInputType.multiline,
          onTap: () async => ensureTextFieldVisible(context),
          decoration: InputDecoration.collapsed(
            hintText: s.key(Lk.notes),
            hintStyle: textTheme.labelMedium?.copyWith(color: colorScheme.tertiary),
          ),
          style: textTheme.labelMedium?.copyWith(color: colorScheme.onSurface.withOpacity(0.8)),
        ),

        const VSpacer(Insets.s),

        _DatePicker(widget.todo),

        const VSpacer(Insets.s),

        const Divider(thickness: Strokes.thin, height: 0),
      ],
    );
  }
}

class _DatePicker extends StatelessWidget {
  const _DatePicker(this.todo);

  final TodoData todo;

  Future<void> _pickDate(BuildContext context) async {
    final dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime.parse('2024-00-00'),
      lastDate: DateTime.parse('9999-00-00'),
    );

    if (dateTime == null || !context.mounted) return;

    Todos.of(context).update(todo, todo.copyWith(dateTime: dateTime));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final dateTime = todo.dateTime;
    final s = S.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async => _pickDate(context),
        child: Text(
          dateTime == null ? s.key(Lk.pickDateTime) : '${dateTime.day}.${dateTime.month}.${dateTime.year % 100}',
          style: textTheme.labelMedium?.copyWith(color: colorScheme.secondary),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton(this.todo, this.index, this.mode);

  final int index;
  final TodoData todo;
  final ValueNotifier<TodoCardMode?> mode;

  void _onDeleteTap(BuildContext context) => Todos.of(context).delete(todo);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListenableBuilder(
      listenable: mode,
      builder: (_, __) {
        final value = mode.value;

        if (value == null) return const SizedBox.shrink();

        return switch (value) {
          TodoCardMode.drag => ReorderableDragStartListener(
              index: index,
              child: const Icon(Icons.drag_handle_rounded),
            ),
          TodoCardMode.delete => IconButton(
              icon: Icon(Icons.delete_outline_rounded, color: colorScheme.error),
              onPressed: () => _onDeleteTap(context),
              color: colorScheme.error,
            ),
        };
      },
    );

    // return PopupMenuButton<void>(
    //   icon: const Icon(Icons.more_vert),
    //   itemBuilder: (_) => <PopupMenuEntry<void>>[
    //     PopupMenuItem(
    //       onTap: () async => _pickDate(context),
    //       child: Row(
    //         children: [
    //           const Icon(Icons.visibility_outlined),
    //           const HSpacer(Insets.xs),
    //           Text(
    //             s.key(Lk.addDate),
    //             style: textTheme.bodyMedium,
    //           ),
    //         ],
    //       ),
    //     ),
    //     PopupMenuItem(
    //       onTap: () => _onDeleteTap(context),
    //       child: Row(
    //         children: [
    //           Icon(Icons.delete_outline, color: colorScheme.error),
    //           const HSpacer(Insets.xs),
    //           Text(
    //             s.key(Lk.delete),
    //             style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
