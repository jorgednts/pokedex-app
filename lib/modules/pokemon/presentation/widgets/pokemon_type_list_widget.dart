import 'package:flutter/material.dart';
import '../../domain/model/pokemon_model.dart';

class PokemonTypeList extends StatelessWidget {
  const PokemonTypeList({required this.pokemon, Key? key, }) : super(key: key);

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:
          const EdgeInsets.only(left: 30, top: 8),
          child: Wrap(
            children: List.generate(
              pokemon.typeList.length,
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 3),
                child: Chip(
                  label: Text(
                    pokemon.typeList[index],
                    style: const TextStyle(
                        color: Colors.white),
                  ),
                  backgroundColor:
                  const Color(0xFFEC0344),
                ),
              ),
            ),
          ),
        ),
      ],
    );
}
