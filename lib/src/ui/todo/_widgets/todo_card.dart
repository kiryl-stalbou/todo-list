import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/sizes.dart';
import '../../../entities/todo/todo_data.dart';
import '../../../l10n/lk.dart';
import '../../../l10n/s.dart';
import '../../../utils/mixins/ensure_visible.dart';
import '../../_widgets/common/spacers.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({required this.todo, super.key});

  final TodoData todo;

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //
            _CompleteToggle(todo),

            Expanded(child: _InputFields(todo)),

            _ActionMenu(todo),

            // Makes sure that web scroll bar dont overlaps components
            if (kIsWeb) const HSpacer(Insets.l),
          ],
        ),
      );
}

class _CompleteToggle extends StatefulWidget {
  const _CompleteToggle(this.todo);

  final TodoData todo;

  @override
  State<_CompleteToggle> createState() => _CompleteToggleState();
}

class _CompleteToggleState extends State<_CompleteToggle> {
  late bool _isCompleted = widget.todo.isCompleted;

  void _onChanged(bool? value) {
    setState(() => _isCompleted = value ?? false);
    // ignore: discarded_futures
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.xs),
        child: Checkbox(value: _isCompleted, onChanged: _onChanged),
      );
}

class _InputFields extends StatefulWidget {
  const _InputFields(this.todo);

  final TodoData todo;

  @override
  State<_InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<_InputFields> with AutomaticKeepAliveClientMixin {
  late final _titleController = TextEditingController(text: widget.todo.title);
  late final _notesController = TextEditingController(text: widget.todo.title);

  void _onChanged(String text) {}

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final s = S.of(context);

    return Column(
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

        const Divider(thickness: Strokes.thin, height: 0),
      ],
    );
  }
}

class _ActionMenu extends StatelessWidget {
  const _ActionMenu(this.todo);

  final TodoData todo;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final s = S.of(context);

    return PopupMenuButton<void>(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (_) => <PopupMenuEntry<void>>[
        PopupMenuItem(
          onTap: () => showDatePicker(
            context: context,
            firstDate: DateTime.parse('2024-00-00'),
            lastDate: DateTime.parse('9999-00-00'),
          ),
          child: Row(
            children: [
              const Icon(Icons.visibility_outlined),
              const HSpacer(Insets.xs),
              Text(
                s.key(Lk.addDate),
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.delete_outline, color: colorScheme.error),
              const HSpacer(Insets.xs),
              Text(
                s.key(Lk.delete),
                style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
