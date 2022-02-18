import 'package:pokedex_app/modules/pokemon/domain/model/pokemon_model.dart';

abstract class PokemonRepository{
  Future<List<PokemonModel>> getPokemonList();
}