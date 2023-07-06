import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hurst/pages/favorites/favorite_page.dart';
import 'package:hurst/pages/home/cubit/favorite_time_serie/favorite_time_serie_cubit.dart';
import 'package:hurst/pages/home/cubit/filter_time_serie_by_index/change_index_cubit.dart';
import 'package:hurst/pages/home/cubit/filter_time_serie_by_index/change_index_state.dart';
import 'package:hurst/pages/home/cubit/time_serie/time_serie_cubit.dart';
import 'package:hurst/pages/splash/splash_page.dart';
import 'package:hurst/pages/time_serie_details/cubit/oreder_list/sort_list_cubit.dart';
import 'package:hurst/pages/time_serie_details/time_serie_details_page.dart';
import 'package:hurst/repository/api/time_serie_repository.dart';
import 'package:hurst/theme/light/app_theme.dart';

import 'firebase_options.dart';
import 'i18n/resources.dart';
import 'pages/home/home_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const SplashPage());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static String platformLocale = Platform.localeName;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
    }

  @override
  Widget build(BuildContext context) {
    R.load(Locale(Platform.localeName));
    FlutterNativeSplash.remove();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteTimeSerieCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeIndexCubit(InitialIndexState(0).index),
        ),
        BlocProvider(
          create: (context) => TimeSerieCubit(
            TimeSerieRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => SortListCubit(
            sort: {"by": "high", "as": "asc"},
          ),
        )
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
