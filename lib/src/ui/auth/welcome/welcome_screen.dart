import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'states/mobile_welcome_screen.dart';
import 'states/web_welcome_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return const WebWelcomeScreen();

    return const MobileWelcomeScreen();
  }
}
