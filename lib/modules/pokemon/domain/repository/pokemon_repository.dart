import '../model/pokemon/pokemon_model.dart';

abstract class PokemonRepository {
  Future<List<PokemonModel>> getPokemonList();

  Future<PokemonModel> getPokemonTyped(String typedPokemon);
}
