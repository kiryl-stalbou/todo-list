import 'package:flutter/material.dart';

import '../../../../theme.dart';
import '../../../constants/sizes.dart';
import '../../../utils/mixins/theme_state_mixin.dart';
import '../../_widgets/indicators/circular_loading_indicator.dart';
import '../../_widgets/scaffolds/app_scaffold.dart';

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
  Widget build(BuildContext context) => const AppScaffold(
        body: Center(
          child: CircularLoadingIndicator(dimension: Indicators.xl),
        ),
      );
}
