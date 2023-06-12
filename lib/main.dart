import 'package:app_music_v3/pages/detail/detail_viewmodel.dart';
import 'package:app_music_v3/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'base/di/locator.dart';
import 'generated/l10n.dart';
import 'main_viewmodel.dart';
void main() {
  setUpInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<MainVM>(create: (_) => MainVM()),
        ChangeNotifierProvider<DetailMusicViewModel>(create: (_) => DetailMusicViewModel())],

      child: MaterialApp(
        title: 'Music App',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        themeMode: ThemeMode.system,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('en','US'),
        home: const MyHomePage(),
      ),
    );
  }
} 



