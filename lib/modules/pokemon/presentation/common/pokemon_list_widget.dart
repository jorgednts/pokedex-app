import 'package:flutter/material.dart';
import '../../domain/model/pokemon/pokemon_model.dart';
import 'pokedex_card_widget.dart';


class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget(
      {required this.scrollController, required this.pokemonList, Key? key,})
      : super(key: key);

  final ScrollController? scrollController;
  final List<PokemonModel> pokemonList;

  @override
  Widget build(BuildContext context) => Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 8, right: 8),
        child: GridView.builder(
          controller: scrollController,
          key: const PageStorageKey(0),
          itemCount:pokemonList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 5, crossAxisSpacing: 5, crossAxisCount: 3),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: PokedexCardWidget(
              pokemon: pokemonList[index],
            ),
          ),
        ),
      ),
    );
}
