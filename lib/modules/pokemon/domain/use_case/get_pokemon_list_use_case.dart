import '../model/pokemon_model.dart';

mixin GetPokemonListUseCase{
  Future<List<PokemonModel>> call();
}