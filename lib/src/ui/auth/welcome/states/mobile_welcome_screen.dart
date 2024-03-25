import 'package:flutter/material.dart';

import '../../../_widgets/appbars/static_appbar.dart';
import '../../../_widgets/common/header.dart';
import '../../../_widgets/scaffolds/app_scaffold.dart';

class MobileWelcomeScreen extends StatefulWidget {
  const MobileWelcomeScreen({super.key});

  @override
  State<MobileWelcomeScreen> createState() => _MobileWelcomeScreenState();
}

class _MobileWelcomeScreenState extends State<MobileWelcomeScreen> {
  @override
  Widget build(BuildContext context) => AppScaffold(
        top: const StaticAppBar(),
        body: Column(
          children: [
            Header(
              title: 'title',
              subtitle: 'subtitle',
            ),
          ],
        ),
      );
}
