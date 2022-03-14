import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../pokedex_constants/pokedex_constants_colors.dart';
import '../controllers/pokemon_list_controller.dart';

class PokedexTextFieldWidget extends StatelessWidget {
  const PokedexTextFieldWidget(
      {required this.controller, required this.textEditingController, Key? key})
      : super(key: key);

  final TextEditingController textEditingController;
  final PokemonListController controller;

  @override
  Widget build(BuildContext context) => TextField(
        onEditingComplete: () {
          if (textEditingController.text.isEmpty) {
            controller.getPokemonList();
          }
        },
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: S.of(context).textFieldPokedexTitle,
          hintStyle:
              const TextStyle(color: PokedexConstantsColors.hintTextColor),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        onChanged: controller.getPokemonTyped,
      );
}
