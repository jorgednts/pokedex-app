import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/modules/pokemon/presentation/widgets/pokemon_stat_list_builder.dart';
import '../../domain/model/pokemon_model.dart';

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
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 50,
                        right: 2,
                        child: Image.asset(
                          'assets/images/pokeball.png',
                          height: 130,
                          width: 130,
                          color: Colors.blueGrey.withOpacity(1),
                          colorBlendMode: BlendMode.modulate,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 120),
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: SvgPicture.network(
                            pokemon.image,
                            placeholderBuilder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 508,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 8),
                                child: Wrap(
                                  children: List.generate(
                                    pokemon.typeList.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: Chip(
                                        label: Text(
                                          pokemon.typeList[index],
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        backgroundColor:
                                            const Color(0xFFEC0344),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/weight_icon.png',
                                            width: 16,
                                            height: 16,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 3),
                                            child: Text(
                                              '${(pokemon.weight / 10).toString()}'
                                              ' kg',
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        'Weight',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFB2B2B2)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/height_icon.png',
                                            width: 16,
                                            height: 16,
                                          ),
                                          Text(
                                            '${(pokemon.height / 10).toString()}'
                                            ' m',
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        'Height',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFB2B2B2)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${pokemon.abilityList.first} '
                                        '/ ${pokemon.abilityList.last}',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        'Moves',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFB2B2B2)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text('INFO'),
                          ),
                          const Text(
                            'Base Stats',
                            style: TextStyle(
                                color: Color(0xFFEC0344),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
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
