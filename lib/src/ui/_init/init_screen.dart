import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Theme.of(context).colorScheme.surface,
        child: const Center(child: CircularProgressIndicator()),
      );
}
