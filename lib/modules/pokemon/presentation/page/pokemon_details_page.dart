import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          title: Text(pokemon.name),
          backgroundColor: Colors.transparent,
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
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color(0xFFEC0344), width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(height: 30),
                                    Text(
                                      '${(pokemon.weight / 10).toString()} kg',
                                      style: const TextStyle(fontSize: 14),
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
                                    const SizedBox(height: 30),
                                    Text(
                                      '${(pokemon.height / 10).toString()} m',
                                      style: const TextStyle(fontSize: 14),
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
                                    const SizedBox(height: 30),
                                    Text(
                                      '${pokemon.abilityList.first} / ${pokemon.abilityList.last}',
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
                          const Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 30),
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
                            shrinkWrap: true,
                            itemCount: pokemon.statList.length,
                            itemBuilder: (context, index) => Row(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 32, bottom: 7),
                                child: Text(
                                  '${pokemon.statList[index].name} : ',
                                  style: const TextStyle(
                                      color: Color(0xFFEC0344),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                pokemon.statList[index].base.toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ]),
                          )
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
