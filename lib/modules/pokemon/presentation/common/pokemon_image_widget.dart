import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';


class PokemonImageWidget extends StatelessWidget {
  const PokemonImageWidget({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
            top: 50,
            right: 2,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 130,
              width: 130,
              color: Colors.blueGrey.withOpacity(1),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: SizedBox(
              width: 200,
              height: 200,
              child: SvgPicture.network(
                pokemon.image,
                placeholderBuilder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ],
      );
}
