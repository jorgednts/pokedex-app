import 'package:dio/dio.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/data_source/pokemon_remote_data_source.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/model/pokemon/details/pokemon_response.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/model/pokemon/pokemon_response/pokedex_response.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/remote_to_model/remote_to_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon_model.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  PokemonRemoteDataSourceImpl(
    this.dio,
  );

  final Dio dio;

  @override
  Future<List<PokemonModel>> getAllPokemons() async {
    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/?limit=15');
      final pokedexResponse = PokedexResponse.fromJson(response.data);
      final pokemons = <PokemonModel>[];
      for (final pokemonUrl in pokedexResponse.pokemonUrlList) {
        final response = await dio.get(pokemonUrl.url);
        final pokemonResponse = PokemonResponse.fromJson(response.data);
        final pokemon = pokemonResponse.toPokemonModel();
        pokemons.add(pokemon);
      }
      return pokemons;
    } on DioError catch (dioError, _) {
      throw Exception();
    }
  }
}
