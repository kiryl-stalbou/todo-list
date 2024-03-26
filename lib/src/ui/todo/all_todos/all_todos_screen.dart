import 'package:flutter/material.dart';

import '../../_widgets/appbars/static_appbar.dart';
import '../../_widgets/scaffolds/app_scaffold.dart';

class AllTodosScreen extends StatelessWidget {
  const AllTodosScreen({super.key});

  @override
  Widget build(BuildContext context) => const AppScaffold(
        top: StaticAppBar(),
        body: Center(child: Text('ALL')),
      );
}
