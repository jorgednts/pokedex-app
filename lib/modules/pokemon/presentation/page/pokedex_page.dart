import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/remote/data_source/pokemon_remote_data_source.dart';
import '../../data/remote/data_source/pokemon_remote_data_source_impl.dart';
import '../../data/repository_impl/pokemon_repository_impl.dart';
import '../../domain/model/pokemon_model.dart';
import '../../domain/repository/pokemon_repository.dart';
import '../../domain/use_case/get_pokemon_list_use_case.dart';
import '../../domain/use_case/get_pokemon_list_use_case_impl.dart';
import '../controllers/pokemon_list_controller.dart';
import '../widgets/pokedex_card_widget.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {

  // late PokemonRemoteDataSource pokemonRemoteDataSource;
  // late PokemonRepository pokemonRepository;
  // late GetPokemonListUseCase getPokemonListUseCase;
  // late PokemonListController controller;
  // late List<PokemonModel> pokemonList;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   pokemonRemoteDataSource = PokemonRemoteDataSourceImpl(Dio());
  //   pokemonRepository =
  //       PokemonRepositoryImpl(pokemonRemoteDataSource: pokemonRemoteDataSource);
  //   getPokemonListUseCase =
  //       GetPokemonListUseCaseImpl(pokemonRepository: pokemonRepository);
  //   controller = PokemonListController(pokemonList: getPokemonListUseCase);
  //   pokemonList = controller.getPokemonList() as List<PokemonModel>;
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 48, right: 13),
                        child: Image.asset('assets/images/logo_icon.png'),
                      ),
                      const Text('ioasys pokédex',
                          style: TextStyle(
                            color: Color(0xFFEC0344),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Buscar Pokemon',
                              hintStyle:
                                  const TextStyle(color: Color(0xFF767676)),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(30, 20, 20, 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Icon(
                          Icons.favorite,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 15,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            crossAxisCount: 3),
                    itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(left: 3, right: 3),
                      child: PokedexCardWidget(
                          pokemonName: 'pokemon name', pokemonID: '#ID'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
