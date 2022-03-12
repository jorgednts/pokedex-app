import 'package:flutter/material.dart';
import 'package:pokedex_app/modules/pokemon/domain/model/pokemon/pokemon_model.dart';
import 'package:pokedex_app/modules/pokemon/presentation/widgets/pokemon_image_widget.dart';
import 'package:pokedex_app/modules/pokemon/presentation/widgets/pokemon_properties_widget.dart';
import 'package:pokedex_app/modules/pokemon/presentation/widgets/pokemon_stat_list_builder.dart';
import 'package:pokedex_app/modules/pokemon/presentation/widgets/pokemon_type_list_widget.dart';



class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({
    required this.pokemon,
    Key? key,
  }) : super(key: key);
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFFEC0344),
        appBar: AppBar(
          title: Text(pokemon.name,
              style: const TextStyle(fontWeight: FontWeight.w700)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                '#${pokemon.id.toString()}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Center(
              child: Column(
                children: [
                  PokemonImageWidget(pokemon: pokemon),
                  Container(
                    width: 400,
                    child: Card(
                      margin: const EdgeInsets.all(5),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color(0xFFEC0344), width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          PokemonTypeList(pokemon: pokemon),
                          PokemonPropertiesWidget(pokemon: pokemon),
                          const Text(
                            'Base Stats',
                            style: TextStyle(
                                color: Color(0xFFEC0344),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(),
                            shrinkWrap: true,
                            itemCount: pokemon.statList.length,
                            itemBuilder: (context, index) =>
                                PokemonStatListBuilder(
                              pokemon: pokemon,
                              index: index,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
