import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hurst/pages/favorites/favorite_page.dart';
import 'package:hurst/pages/splash/splash_page.dart';
import 'package:hurst/pages/time_serie_details/time_serie_details_page.dart';
import 'package:hurst/theme/light/app_theme.dart';

import 'firebase_options.dart';
import 'pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SplashPage());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hurst Test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().makeAppLightTheme(),
      darkTheme: AppTheme().makeAppDarkTheme(),
      themeMode: ThemeMode.system,
      routes: {
        "/": (context) => const HomePage(),
        "/favorites": (context) => const FavoritePage(),
        "/details": (context) => const TimeSerieDetailsPage(),
      },
      initialRoute: HomePage.route,
    );
  }
}
