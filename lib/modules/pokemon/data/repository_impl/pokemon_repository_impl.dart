import 'package:pokedex_app/modules/pokemon/data/remote/data_source/pokemon_remote_data_source.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(
      {required PokemonRemoteDataSource pokemonRemoteDataSource})
      : _pokemonRemoteDataSource = pokemonRemoteDataSource;

  final PokemonRemoteDataSource _pokemonRemoteDataSource;

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    try{
      final pokemonList = await _pokemonRemoteDataSource.getAllPokemons();
      return pokemonList;
    } on Exception{
      return _pokemonRemoteDataSource.getAllPokemons();
    }
  }
}
