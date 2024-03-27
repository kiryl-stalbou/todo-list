import 'package:flutter/material.dart';

import '../../_widgets/common/paddings.dart';

class TabTitle extends StatelessWidget {
  const TabTitle(this.data, {super.key});

  final String data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: AppPadding(
        child: Text(
          data,
          style: textTheme.headlineMedium,
        ),
      ),
    );
  }
}
