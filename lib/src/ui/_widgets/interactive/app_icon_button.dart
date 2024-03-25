import 'package:flutter/material.dart';

import 'tap_detector.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.onTap,
    this.dimension = kMinInteractiveDimension,
    super.key,
  });

  final Widget icon;
  final double dimension;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => TapDetector(
        onTap: onTap,
        child: SizedBox.square(
          dimension: dimension,
          child: icon,
        ),
      );
}
