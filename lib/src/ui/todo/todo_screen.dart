import 'package:flutter/material.dart';

import '../../scopes/app/dependencies/auth/auth.dart';
import '../_widgets/interactive/tap_detector.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: TapDetector(
          onTap: () => Auth.of(context).signOut(),
          child: Text('TODO'),
        ),
      );
}
