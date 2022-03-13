import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokedex_constants/pokedex_constants_colors.dart';
import 'package:pokedex_app/modules/pokemon/constants/pokemon_constants_images.dart';

import '../../../../generated/l10n.dart';
import '../../domain/model/pokemon/pokemon_model.dart';

class PokemonPropertiesWidget extends StatelessWidget {
  const PokemonPropertiesWidget({
    required this.pokemon,
    Key? key,
  }) : super(key: key);
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
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
                        PokemonConstantsImages.weightIcon,
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
                  Text(
                    S.of(context).weightPropertyText,
                    style: const TextStyle(
                        fontSize: 12,
                        color: PokedexConstantsColors.propertyTextColor),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        PokemonConstantsImages.heightIcon,
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
                  Text(
                    S.of(context).heightPropertyText,
                    style: const TextStyle(
                        fontSize: 12,
                        color: PokedexConstantsColors.propertyTextColor),
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
                  Text(
                    S.of(context).movesPropertyText,
                    style: const TextStyle(
                        fontSize: 12,
                        color: PokedexConstantsColors.propertyTextColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
