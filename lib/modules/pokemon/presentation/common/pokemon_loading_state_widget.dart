import 'package:flutter/material.dart';

class PokemonLoadingStateWidget extends StatelessWidget {
  const PokemonLoadingStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          height: 50,
          width: 50,
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
}
