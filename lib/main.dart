import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokemon/presentation/page/pokedex_page.dart';
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
        // initialRoute: '/',
        // routes: {
        //   '/':(context) => const SplashPage(),
        //   '/pokedex': (context) => const PokedexPage(),
        //   '/pokemon-details': (context) => const Pokedex
        },
      );
}

