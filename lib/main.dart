import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'modules/pokedex_constants/pokedex_constants_colors.dart';
import 'modules/pokedex_constants/pokedex_constants_fonts.dart';

import 'modules/splash/presentation/page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Pokedex App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: PokedexConstantsFonts.poppins,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: PokedexConstantsColors.primaryColor,
            secondary: const Color(0xFF9E9E9E),
          ),
          toggleableActiveColor: PokedexConstantsColors.primaryColor,
          iconTheme: const IconThemeData(
            color: PokedexConstantsColors.primaryColor,
          ),
          listTileTheme: const ListTileThemeData(
              iconColor: PokedexConstantsColors.primaryColor),
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
