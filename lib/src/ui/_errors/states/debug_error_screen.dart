import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../_widgets/common/spacers.dart';

class DebugErrorScreen extends StatelessWidget {
  const DebugErrorScreen(this.errors, {super.key});

  final List<(Object, StackTrace)> errors;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final style = textTheme.labelSmall?.copyWith(color: colorScheme.onError);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: Insets.l),
          itemCount: errors.length,
          separatorBuilder: (_, index) => Divider(color: colorScheme.onError, height: Insets.m),
          itemBuilder: (_, index) => Column(
            children: [
              //
              Text(errors[index].$1.toString(), style: style),

              const VSpacer(Insets.m),

              Text(errors[index].$2.toString(), style: style),
            ],
          ),
        ),
      ),
    );
  }
}
