import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../pokemon/constants/pokemon_constants_images.dart';
import '../controller/splash_controller.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController control = SplashController();

  @override
  void initState() {
    super.initState();
    control.goToPokedexPage(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFEC0344),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(PokemonConstantsImages.logoHome),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(S.of(context).pageTitle,
                    style: const TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ],
          ),
        ),
      );
}
