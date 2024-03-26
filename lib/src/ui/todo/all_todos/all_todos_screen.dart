import 'package:flutter/material.dart';

import '../../../l10n/lk.dart';
import '../../../l10n/s.dart';
import '../../_widgets/appbars/scroll_aware_appbar.dart';
import '../../_widgets/common/paddings.dart';
import '../../_widgets/scaffolds/app_scaffold.dart';
import '../_widgets/tab_title.dart';

class AllTodosScreen extends StatelessWidget {
  const AllTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return AppScaffold(
      top: ScrollAwareAppBar(
        title: Text(s.key(Lk.all)),
        showTitleScrollExtent: 40,
      ),
      body: AppPadding(
        child: CustomScrollView(
          slivers: [
            TabTitle(s.key(Lk.all)),
          ],
        ),
      ),
    );
  }
}
