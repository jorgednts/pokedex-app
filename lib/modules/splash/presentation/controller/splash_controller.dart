import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokemon/presentation/page/pokedex_page.dart';

class SplashController {
  Future<void> goToPokedexPage(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const PokedexPage()));
  }
}
