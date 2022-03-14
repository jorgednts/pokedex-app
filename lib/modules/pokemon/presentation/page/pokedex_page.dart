import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokemon/presentation/common/pokedex_text_field_widget.dart';
import 'package:pokedex_app/modules/pokemon/presentation/common/pokemon_loading_state_widget.dart';

import '../../../../generated/l10n.dart';
import '../../../pokedex_constants/pokedex_constants_colors.dart';
import '../../constants/pokemon_constants_images.dart';
import '../../data/remote/data_source/pokemon_remote_data_source.dart';
import '../../data/repository/pokemon_repository_impl.dart';
import '../../domain/model/pokemon/pokemon_model.dart';
import '../../domain/repository/pokemon_repository.dart';
import '../../domain/use_case/get_pokemon_list_use_case.dart';
import '../../domain/use_case/get_pokemon_typed_use_case.dart';
import '../../external/remote_data_source/pokemon_remote_data_source_impl.dart';
import '../common/error_text_widget.dart';
import '../common/pokemon_list_widget.dart';
import '../controllers/pokemon_list_controller.dart';
import 'pokedex_page_state.dart';

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
      if (textEditingController.text.isEmpty) {
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
                      child: Image.asset(PokemonConstantsImages.logoIcon),
                    ),
                    Text(S.of(context).pageTitle,
                        style: const TextStyle(
                          color: PokedexConstantsColors.primaryColor,
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: PokedexTextFieldWidget(
                              controller: controller,
                              textEditingController: textEditingController),
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
                            _showSnackBar(S.of(context).snackBarText);
                          }),
                    ],
                  ),
                ),
                ValueListenableBuilder<PokedexPageState>(
                  valueListenable: controller,
                  builder: (context, state, _) {
                    switch (state) {
                      case PokedexPageState.loading:
                        return const PokemonLoadingStateWidget();

                      case PokedexPageState.successPokemonList:
                        return PokemonListWidget(
                            scrollController: _scrollController,
                            pokemonList: controller.pokemonList);

                      case PokedexPageState.successPokemonTyped:
                        return PokemonListWidget(
                            scrollController: null,
                            pokemonList: controller.pokemonsTyped);

                      case PokedexPageState.genericError:
                        return ErrorTextWidget(
                            errorText: S.of(context).genericErrorPokedexText);

                      case PokedexPageState.networkError:
                        return ErrorTextWidget(
                            errorText: S.of(context).networkErrorPokedexText);

                      case PokedexPageState.notFoundPokemon:
                        return ErrorTextWidget(
                            errorText:
                                S.of(context).notFoundPokemonErrorPokedexText);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
