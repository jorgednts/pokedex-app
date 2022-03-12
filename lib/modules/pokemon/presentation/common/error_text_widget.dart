import 'package:flutter/material.dart';

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
      child: Text(
        errorText.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: const Color(0xFFEC0344).withAlpha(85),
          fontSize: 30,
        ),
      ),
    ),
  );
}
