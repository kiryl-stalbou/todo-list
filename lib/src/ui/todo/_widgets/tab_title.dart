import 'package:flutter/material.dart';

class TabTitle extends StatelessWidget {
  const TabTitle(this.data, {super.key});

  final String data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Text(
        data,
        style: textTheme.headlineMedium,
      ),
    );
  }
}
