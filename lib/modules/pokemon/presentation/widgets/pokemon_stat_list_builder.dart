import 'package:flutter/material.dart';
import '../../domain/model/pokemon_model.dart';

class PokemonStatListBuilder extends StatelessWidget {
  const PokemonStatListBuilder({
    required this.pokemon, required this.index,
    Key? key,
  }) : super(key: key);

  final PokemonModel pokemon;
  final int index;

  @override
  Widget build(BuildContext context) =>
      Row(children: [
        SizedBox(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  '${getStat()}',
                  style: const TextStyle(
                      color: Color(0xFFEC0344),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                pokemon.statList[index].base.toString(),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ]);

  String getStat(){
    switch (index){
      case 0:
        return  'HP';
      case 1:
        return 'ATK';
      case 2:
        return 'DEF';
      case 3:
        return 'SATK';
      case 4:
        return 'SDEF';
      case 5:
        return 'SPD';
      default:
        return pokemon.statList[index].name;
    }
  }
}