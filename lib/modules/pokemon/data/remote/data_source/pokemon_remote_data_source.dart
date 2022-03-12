import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';


abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemonList();

  Future<PokemonModel> getPokemonTyped(String typedPokemon);
}
