import 'package:flutter/material.dart';

import '../../scopes/app/dependencies/auth/auth.dart';
import '../../scopes/user/dependencies/user/user.dart';
import '../_widgets/interactive/tap_detector.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: TapDetector(
          onTap: () async => Auth.of(context).signOut(),
          child: Text('${User.of(context).user}'),
        ),
      );
}
