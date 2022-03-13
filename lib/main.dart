import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pokedex_app/generated/l10n.dart';

import 'modules/splash/presentation/page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        title: 'Pokedex App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFEC0344),
            secondary: const Color(0xFF9E9E9E),
          ),
          toggleableActiveColor: const Color(0xFFEC0344),
          iconTheme: const IconThemeData(
            color: Color(0xFFEC0344),
          ),
          listTileTheme: const ListTileThemeData(iconColor: Color(0xFFEC0344)),
        ),
        home: const SplashPage(),
        localizationsDelegates: const [
          // 1
          S.delegate,
          // 2
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,


      );
}

