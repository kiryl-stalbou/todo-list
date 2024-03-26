import 'package:flutter/material.dart';

import 'todo_tabs.dart';

mixin TodoTabsController<S extends StatefulWidget> on State<S> {
  late TodoTabsState _todoTabsState;
  late int selectedTabIndex;

  void onTabSelect(int index) => _todoTabsState.selectedTabIndex = index;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _todoTabsState = TodoTabs.of(context);
    selectedTabIndex = _todoTabsState.selectedTabIndex;
  }
}
