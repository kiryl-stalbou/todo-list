import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../l10n/lk.dart';
import '../../../../l10n/s.dart';

class SignInButton extends StatelessWidget {
  const SignInButton(this.onTap, {super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final s = S.of(context);

    return TextButton(
      onPressed: onTap,
      child: Text(
        s.key(Lk.signupHaveAcc),
        style: textTheme.bodySmall?.copyWith(
          color: AppColors.blue,
        ),
      ),
    );
  }
}
