import '../../domain/model/pokemon_model.dart';
import '../../domain/use_case/get_pokemon_list_use_case.dart';

class PokemonListController {
  PokemonListController({required GetPokemonListUseCase pokemonList})
      : _pokemonList = pokemonList;
  final GetPokemonListUseCase _pokemonList;

  Future<List<PokemonModel>> getPokemonList() async => _pokemonList.call();
}
