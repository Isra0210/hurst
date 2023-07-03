import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = SystemTheme.isDarkMode;

    return Container(
      color: darkMode ? const Color(0xFF1f1f1f) : Colors.white,
      child: Center(
        child: Image.asset(
          darkMode ? 'lib/assets/logo_dark.png' : 'lib/assets/logo.png',
        ),
      ),
    );
  }
}
