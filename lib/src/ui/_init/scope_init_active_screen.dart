import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme.dart';
import '../../constants/sizes.dart';
import '../../utils/mixins/theme_state_mixin.dart';
import '../_widgets/common/paddings.dart';

class ScopeInitActiveScreen extends StatefulWidget {
  const ScopeInitActiveScreen({super.key});

  @override
  State<ScopeInitActiveScreen> createState() => _ScopeInitActiveScreenState();
}

class _ScopeInitActiveScreenState extends State<ScopeInitActiveScreen> with ThemeStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resolveSystemUiOverlayStyle(theme, colorScheme.primary);
  }

  @override
  void dispose() {
    resolveSystemUiOverlayStyle(theme);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: colorScheme.primary,
        child: const Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            //
            Center(child: _AppLogo()),

            Align(
              alignment: Alignment.bottomCenter,
              child: _AppName(),
            ),
          ],
        ),
      );
}

class _AppLogo extends StatelessWidget {
  const _AppLogo();

  @override
  Widget build(BuildContext context) => const Icon(
        CupertinoIcons.calendar_badge_plus,
        size: 100,
      );
}

class _AppName extends StatelessWidget {
  const _AppName();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AppSafePadding(
      extraBottom: Insets.m,
      child: Text(
        'Todo App Krainet',
        style: textTheme.headlineLarge?.copyWith(
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}
