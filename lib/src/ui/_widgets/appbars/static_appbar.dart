import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app.dart';
import '../../../constants/colors.dart';
import '../common/three_children_layout.dart';
import '../interactive/app_icon_button.dart';

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
                AppIconButton(onTap: () => TodoLocalizations.toggle(context), icon: const Icon(Icons.language)),
                AppIconButton(onTap: () => TodoTheme.toggle(context), icon: const Icon(CupertinoIcons.moon_circle)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
