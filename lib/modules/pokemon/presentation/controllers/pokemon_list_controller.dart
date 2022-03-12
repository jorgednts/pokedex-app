import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokemon/domain/exception/generic_error_status_code_exception.dart';
import 'package:pokedex_app/modules/pokemon/domain/exception/network_error_exception.dart';
import 'package:pokedex_app/modules/pokemon/domain/exception/not_found_pokemon_exception.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/get_pokemon_typed_use_case.dart';

import '../../domain/use_case/get_pokemon_list_use_case.dart';
import '../page/pokedex_page_state.dart';

class PokemonListController extends ValueNotifier<PokedexPageState> {
  PokemonListController(
      {required GetPokemonListUseCase getPokemonListUseCase,
      required GetPokemonTypedUseCase getPokemonTypedUseCase})
      : _getPokemonListUseCase = getPokemonListUseCase,
        _getPokemonTypedUseCase = getPokemonTypedUseCase,
        super(PokedexPageState.loading);
  final GetPokemonListUseCase _getPokemonListUseCase;
  final GetPokemonTypedUseCase _getPokemonTypedUseCase;

  List<PokemonModel> pokemonList = [];
  bool isFetchData = false;

  Future<void> getPokemonList() async {
    if (isFetchData) {
      return;
    }
    isFetchData = true;
    value = PokedexPageState.loading;
    try {
      final pokemons = await _getPokemonListUseCase.call();
      pokemonList.addAll(pokemons);
      isFetchData = false;
      value = PokedexPageState.success;
    } on GenericErrorStatusCodeException {
      value = PokedexPageState.genericError;
      isFetchData = false;
    } on NetworkErrorException {
      value = PokedexPageState.networkError;
      isFetchData = false;
    } catch (e) {
      value = PokedexPageState.genericError;
      isFetchData = false;
    }
  }

  Future<void> getPokemonTyped(String pokemonTyped) async {
    print(pokemonList.length);
    pokemonList.clear();
    print(pokemonList.length);
    value = PokedexPageState.loading;  
    try {
      final pokemon =
          await _getPokemonTypedUseCase.call(pokemonTyped.toLowerCase());
      pokemonList.add(pokemon);
      value = PokedexPageState.success;
    } on GenericErrorStatusCodeException{
      value = PokedexPageState.genericError;
    } on NetworkErrorException {
      value = PokedexPageState.networkError;
    } on NotFoundPokemonException {
      value = PokedexPageState.notFoundPokemon;
    } catch (e) {
      value = PokedexPageState.genericError;
    }
  }
}
