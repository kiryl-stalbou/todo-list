import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app.dart';
import '../../../constants/colors.dart';
import '../../../l10n/lk.dart';
import '../../../l10n/s.dart';
import '../common/three_children_layout.dart';

class StaticAppBar extends StatelessWidget {
  const StaticAppBar({
    this.title,
    this.titleSpacing,
    super.key,
  });

  final Widget? title;
  final double? titleSpacing;

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;
    final s = S.of(context);

    Widget? title = this.title;
    if (title != null) {
      title = DefaultTextStyle(
        style: appBarTheme.titleTextStyle ?? const TextStyle(),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        child: title,
      );
    }

    final implyBackButton = ModalRoute.of(context)?.impliesAppBarDismissal ?? false;

    return ColoredBox(
      color: appBarTheme.backgroundColor ?? AppColors.red,
      child: SafeArea(
        child: SizedBox(
          height: appBarTheme.toolbarHeight,
          child: ThreeChildrenLayout(
            middleSpacing: titleSpacing,
            leading: implyBackButton ? const BackButton() : null,
            middle: title,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: s.key(Lk.toggleLanguage),
                  onPressed: () => TodoLocalizations.toggle(context),
                  icon: const Icon(Icons.language),
                ),
                IconButton(
                  tooltip: s.key(Lk.toggleTheme),
                  onPressed: () => TodoTheme.toggle(context),
                  icon: const Icon(CupertinoIcons.moon_circle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
