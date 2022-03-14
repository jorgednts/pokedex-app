import 'package:flutter/material.dart';
import '../../constants/pokemon_constants_conversion_factors.dart';
import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonStatListBuilder extends StatelessWidget {
  const PokemonStatListBuilder({
    required this.pokemon,
    required this.index,
    Key? key,
  }) : super(key: key);

  final PokemonModel pokemon;
  final int index;

  @override
  Widget build(BuildContext context) => Row(children: [
        SizedBox(
          width: 80,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              '${getStat()}',
              style: TextStyle(
                  color: pokemon
                      .mapPokemonTypeToColor(pokemon.colorNameByFirstType),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 40,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              pokemon.statList[index].base.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          width: 200,
          child: LinearProgressIndicator(
            backgroundColor: pokemon
                .mapPokemonTypeToColor(pokemon.colorNameByFirstType)
                .withAlpha(50),
            color: pokemon.mapPokemonTypeToColor(pokemon.colorNameByFirstType),
            value: pokemon.statList[index].base /
                PokemonConstantsConversionFactors.statConversionFactor,
          ),
        )
      ]);

  String getStat() {
    switch (index) {
      case 0:
        return 'HP';
      case 1:
        return 'ATK';
      case 2:
        return 'DEF';
      case 3:
        return 'SATK';
      case 4:
        return 'SDEF';
      case 5:
        return 'SPD';
      default:
        return pokemon.statList[index].name;
    }
  }
}
