import 'dart:async';
import 'package:flutter/material.dart';

class SplashController {
  Future<void> goToPokedexPage(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    await Navigator.pushReplacementNamed(
        context, '/pokedex');
  }
}
