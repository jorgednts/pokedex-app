import 'package:flutter/material.dart';

class PokedexCardWidget extends StatelessWidget {
  const PokedexCardWidget({
    required this.pokemonName,
    required this.pokemonID,
    Key? key,
  }) : super(key: key);

  final String pokemonName;
  final String pokemonID;

  @override
  Widget build(BuildContext context) => Card(
        color: Colors.transparent,
        elevation: 0,
        margin: const EdgeInsets.all(2),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFFEC0344), width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      pokemonID,
                      style: const TextStyle(
                        color: Color(0xFFEC0344),
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'IMAGEM DO POKEMON',
                  style: TextStyle(color: Color(0xFFEC0344), fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                pokemonName,
                style: const TextStyle(color: Color(0xFFEC0344), fontSize: 10),
              ),
            ),
          ],
        ),
      );
}
