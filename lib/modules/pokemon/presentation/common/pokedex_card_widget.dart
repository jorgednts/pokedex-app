import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import '../page/pokemon_details_page.dart';

class PokedexCardWidget extends StatelessWidget {
  const PokedexCardWidget({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PokemonDetailPage(pokemon: pokemon)));
        },
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          margin: const EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color:
                    pokemon.mapPokemonTypeToColor(pokemon.colorNameByFirstType),
                width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        pokemon.setPokemonId(pokemon.id),
                        style: TextStyle(
                          color: pokemon.mapPokemonTypeToColor(
                              pokemon.colorNameByFirstType),
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SvgPicture.network(
                    pokemon.image,
                    placeholderBuilder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0, top: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: pokemon
                        .mapPokemonTypeToColor(pokemon.colorNameByFirstType),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
