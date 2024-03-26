import 'package:flutter/material.dart';

import '../../../utils/common/hide_keyboard.dart';
import '../interactive/tap_detector.dart';

class HideKeyboardArea extends StatelessWidget {
  const HideKeyboardArea({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => TapDetector(onTap: hideKeyBoard, child: child);
}
