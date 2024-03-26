import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../l10n/lk.dart';
import '../../../../utils/mixins/localization_state_mixin.dart';
import '../../../_widgets/scaffolds/app_scaffold.dart';
import '../../all_todos/all_todos_screen.dart';
import '../../completed_todos/completed_todos_screen.dart';
import '../../today_todos/today_todos_screen.dart';
import '../../user_profile/user_profile_screen.dart';
import '../tabs_controller.dart';

class DesktopTodoTabs extends StatefulWidget {
  const DesktopTodoTabs({super.key});

  @override
  State<DesktopTodoTabs> createState() => _DesktopTodoTabsState();
}

class _DesktopTodoTabsState extends State<DesktopTodoTabs> with LocalizationStateMixin, TodoTabsController {
  static const tabsViews = <Widget>[
    AllTodosScreen(),
    CompletedTodosScreen(),
    TodayTodosScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) => AppScaffold(
        body: Row(
          children: <Widget>[
            //
            NavigationRail(
              selectedIndex: selectedTabIndex,
              onDestinationSelected: onTabSelect,
              labelType: NavigationRailLabelType.all,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: const Icon(Icons.all_inbox_outlined),
                  selectedIcon: const Icon(Icons.all_inbox_rounded),
                  padding: const EdgeInsets.symmetric(vertical: Insets.xs),
                  label: Text(s.key(Lk.all)),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.done_all_outlined),
                  selectedIcon: const Icon(Icons.done_all_rounded),
                  label: Text(s.key(Lk.completed)),
                  padding: const EdgeInsets.symmetric(vertical: Insets.xs),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.today_outlined),
                  selectedIcon: const Icon(Icons.today_rounded),
                  label: Text(s.key(Lk.today)),
                  padding: const EdgeInsets.symmetric(vertical: Insets.xs),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.person_outline),
                  selectedIcon: const Icon(Icons.person_rounded),
                  label: Text(s.key(Lk.profile)),
                  padding: const EdgeInsets.symmetric(vertical: Insets.xs),
                ),
              ],
            ),

            const VerticalDivider(thickness: 0.5, width: 0.5),

            Expanded(child: tabsViews[selectedTabIndex]),
          ],
        ),
      );
}
