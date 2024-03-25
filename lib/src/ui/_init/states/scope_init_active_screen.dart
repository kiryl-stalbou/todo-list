import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../../theme.dart';
import '../../../constants/sizes.dart';
import '../../../utils/mixins/theme_state_mixin.dart';
import '../../_widgets/common/spacers.dart';
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
  Widget build(BuildContext context) => AppScaffold(
        color: colorScheme.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            const Icon(
              CupertinoIcons.calendar_badge_plus,
              size: kIsWeb ? 80 : 40,
            ),

            const VSpacer(Insets.l),

            Text(
              'Todo App for Krainet',
              style: textTheme.displayMedium,
            ),
          ],
        ),
      );
}
