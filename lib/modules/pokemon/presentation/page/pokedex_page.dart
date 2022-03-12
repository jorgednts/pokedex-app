import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokemon/data/remote/data_source/pokemon_remote_data_source.dart';
import 'package:pokedex_app/modules/pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/get_pokemon_list_use_case.dart';
import 'package:pokedex_app/modules/pokemon/domain/use_case/get_pokemon_typed_use_case.dart';
import 'package:pokedex_app/modules/pokemon/external/remote_data_source/pokemon_remote_data_source_impl.dart';
import 'package:pokedex_app/modules/pokemon/presentation/common/pokemon_list_widget.dart';
import 'package:pokedex_app/modules/pokemon/presentation/controllers/pokemon_list_controller.dart';
import 'package:pokedex_app/modules/pokemon/presentation/page/pokedex_page_state.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  late PokemonRemoteDataSource pokemonRemoteDataSource;
  late PokemonRepository pokemonRepository;
  late GetPokemonListUseCase getPokemonListUseCase;
  late PokemonListController controller;
  late List<PokemonModel> pokemonList;
  late ScrollController _scrollController;
  late GetPokemonTypedUseCase getPokemonTypedUseCase;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    pokemonRemoteDataSource = PokemonRemoteDataSourceImpl(dio: Dio());
    pokemonRepository =
        PokemonRepositoryImpl(pokemonRemoteDataSource: pokemonRemoteDataSource);
    getPokemonListUseCase =
        GetPokemonListUseCaseImpl(pokemonRepository: pokemonRepository);
    getPokemonTypedUseCase =
        GetPokemonTypedUseCaseImpl(pokemonRepository: pokemonRepository);
    controller = PokemonListController(
        getPokemonListUseCase: getPokemonListUseCase,
        getPokemonTypedUseCase: getPokemonTypedUseCase);
    _setScrollController();
    controller.getPokemonList();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      if(textEditingController.text.isEmpty){
        controller.getPokemonList();
      }
    });
  }

  void _setScrollController() {
    _scrollController =
        ScrollController(initialScrollOffset: 15, keepScrollOffset: true);
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        controller.getPokemonList();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
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
                          onEditingComplete: (){
                            if(textEditingController.text.isEmpty){
                              controller.getPokemonList();
                            }
                          },
                          controller: textEditingController,
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
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (textTyped) {
                              controller.getPokemonTyped(textTyped);
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Icon(
                            Icons.favorite,
                            size: 30,
                          ),
                        ),
                        onTap: () {
                          _showSnackBar(
                              'TELA DE FAVORITOS AINDA NÃO IMPLEMENTADA');
                        }),
                  ],
                ),
                ValueListenableBuilder<PokedexPageState>(
                  valueListenable: controller,
                  builder: (context, state, _) {
                    switch (state) {
                      case PokedexPageState.loading:
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                        );
                      case PokedexPageState.successPokemonList:
                        return PokemonListWidget(
                            scrollController: _scrollController,
                            pokemonList: controller.pokemonList);

                      case PokedexPageState.successPokemonTyped:
                        return PokemonListWidget(
                            scrollController: null,
                            pokemonList: controller.pokemonsTyped);

                      case PokedexPageState.genericError:
                        return const Expanded(
                          child: Text('OCORREU UM ERRO'),
                        );

                      case PokedexPageState.networkError:
                        return const Expanded(
                          child: Text('ERRO DE INTERNET'),
                        );
                      case PokedexPageState.notFoundPokemon:
                        return const Expanded(
                          child: Text('POKEMON NÃO ENCONTRADO'),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
