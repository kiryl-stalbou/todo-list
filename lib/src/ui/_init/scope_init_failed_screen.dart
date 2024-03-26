import 'package:flutter/material.dart';

import '../../constants/durations.dart';
import '../../l10n/lk.dart';
import '../../l10n/s.dart';
import '../_loading/local/local_loading.dart';
import '../_widgets/common/header.dart';
import '../_widgets/interactive/bottom_button.dart';
import '../_widgets/scaffolds/app_scaffold.dart';

class ScopeInitFailedScreen extends StatelessWidget {
  const ScopeInitFailedScreen(this.onReloadTap, {super.key});

  final VoidCallback onReloadTap;

  Future<void> _onReloadTap(BuildContext context) async {
    await LocalLoading.wait(context, Future<void>.delayed(AppDurations.aestheticDelay));

    if (context.mounted) onReloadTap();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return AppScaffold(
      extendBodyBehindBottom: true,
      bottom: LocalLoading(child: _ReloadButton(_onReloadTap)),
      body: Center(
        child: Header(
          icon: Icons.wifi_off_rounded,
          title: s.key(Lk.scopeInitErrorTitle),
          subtitle: s.key(Lk.scopeInitErrorSubtitle),
        ),
      ),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton(this.onTap);

  final void Function(BuildContext) onTap;

  @override
  Widget build(BuildContext context) => BottomButton(
        listenLocalLoading: true,
        onTap: () => onTap(context),
        child: Text(S.of(context).key(Lk.tryAgain)),
      );
}
