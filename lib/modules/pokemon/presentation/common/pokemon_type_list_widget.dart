import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';

class PokemonTypeList extends StatelessWidget {
  const PokemonTypeList({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 8),
            child: Wrap(
              children: List.generate(
                pokemon.typeList.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Chip(
                    labelPadding: const EdgeInsets.only(
                        top: 0.5, bottom: 0.5, left: 3, right: 3),
                    label: Text(
                      pokemon.typeList[index],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor:
                        pokemon.mapPokemonTypeToColor(pokemon.typeList[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
