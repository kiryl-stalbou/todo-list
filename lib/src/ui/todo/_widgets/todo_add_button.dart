import 'package:flutter/material.dart';

import '../../../l10n/lk.dart';
import '../../../l10n/s.dart';

class TodoAddButton extends StatelessWidget {
  const TodoAddButton({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        tooltip: S.of(context).key(Lk.addTodo),
        onPressed: () {},
        icon: const Icon(Icons.add),
      );
}
