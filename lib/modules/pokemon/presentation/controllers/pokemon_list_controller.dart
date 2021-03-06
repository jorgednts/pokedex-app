import 'package:flutter/material.dart';

import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/exception/not_found_pokemon_exception.dart';
import '../../domain/model/pokemon/pokemon_model.dart';
import '../../domain/use_case/get_pokemon_list_use_case.dart';
import '../../domain/use_case/get_pokemon_typed_use_case.dart';
import '../../utils/string_extensions.dart';
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
  List<PokemonModel> pokemonsTyped = [];

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
      value = PokedexPageState.successPokemonList;
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
    try {
      pokemonsTyped.clear();
      if(!pokemonTyped.isBlank()){
        final pokemon =
        await _getPokemonTypedUseCase.call(pokemonTyped.toLowerCase());
        pokemonsTyped.add(pokemon);
        value = PokedexPageState.successPokemonTyped;
      }
    } on NotFoundPokemonException {
      value = PokedexPageState.notFoundPokemon;
    } on GenericErrorStatusCodeException{
      value = PokedexPageState.genericError;
    } on NetworkErrorException {
      value = PokedexPageState.networkError;
    } catch (e) {
      value = PokedexPageState.genericError;
    }
  }
}
