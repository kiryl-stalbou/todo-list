import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class TapDetector extends StatelessWidget {
  const TapDetector({
    this.behavior = HitTestBehavior.opaque,
    this.excludeFromSemantics = false,
    this.child,
    this.onTapDown,
    this.onTapCancel,
    this.onTap,
    super.key,
  });

  final Widget? child;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCallback? onTap;
  final GestureTapCancelCallback? onTapCancel;
  final HitTestBehavior? behavior;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final Map<Type, GestureRecognizerFactory> gestures = <Type, GestureRecognizerFactory>{};

    gestures[TapGestureRecognizer] = GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
      () => TapGestureRecognizer(debugOwner: this, supportedDevices: null),
      (instance) => instance
        ..onTapDown = onTapDown
        ..onTap = onTap
        ..onTapCancel = onTapCancel
        ..gestureSettings = MediaQuery.maybeGestureSettingsOf(context),
    );

    return RawGestureDetector(
      gestures: gestures,
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      child: child,
    );
  }
}
