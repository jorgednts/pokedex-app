import 'package:flutter/material.dart';

import '../../domain/model/pokemon_model.dart';
import '../../domain/use_case/get_pokemon_list_use_case.dart';
import '../page/pokedex_page_state.dart';

class PokemonListController {
  PokemonListController({required GetPokemonListUseCase getPokemonListUseCase})
      : _getPokemonListUseCase = getPokemonListUseCase;
  final GetPokemonListUseCase _getPokemonListUseCase;

  final ValueNotifier<PokedexPageState> state =
  ValueNotifier<PokedexPageState>(PokedexPageState.loading);

  List<PokemonModel> pokemonList = [];

  Future<void> getPokemonList() async {
    state.value = PokedexPageState.loading;
    try {
      pokemonList = await _getPokemonListUseCase.call();
      state.value = PokedexPageState.success;
    } catch (e) {
      state.value = PokedexPageState.error;
    }
  }

}
