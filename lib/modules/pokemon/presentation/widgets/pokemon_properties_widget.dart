import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';

class PokemonPropertiesWidget extends StatelessWidget {
  const PokemonPropertiesWidget({
    required this.pokemon,
    Key? key,
  }) : super(key: key);
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/weight_icon.png',
                        width: 16,
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Text(
                          '${(pokemon.weight / 10).toString()}'
                          ' kg',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Weight',
                    style: TextStyle(fontSize: 12, color: Color(0xFFB2B2B2)),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/height_icon.png',
                        width: 16,
                        height: 16,
                      ),
                      Text(
                        '${(pokemon.height / 10).toString()}'
                        ' m',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Height',
                    style: TextStyle(fontSize: 12, color: Color(0xFFB2B2B2)),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '${pokemon.abilityList.first} '
                    '/ ${pokemon.abilityList.last}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Moves',
                    style: TextStyle(fontSize: 12, color: Color(0xFFB2B2B2)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
