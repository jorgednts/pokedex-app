import 'package:flutter/material.dart';
import '../../../pokedex_constants/pokedex_constants_colors.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    required this.errorText,
    Key? key,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          errorText.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: PokedexConstantsColors.primaryColor.withAlpha(85),
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
