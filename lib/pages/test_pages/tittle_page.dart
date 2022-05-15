import 'package:arquitectura_universales/widgets/purple_button.dart';
import 'package:arquitectura_universales/widgets/text_box.dart';
import 'package:arquitectura_universales/widgets/tittle_input.dart';
import 'package:flutter/material.dart';

class TittlePage extends StatelessWidget {
  String hintText;
  IconData iconData;
  String buttonText;
  VoidCallback onPressed;

  TittlePage(
      {key,
      required this.hintText,
      required this.iconData,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TittleInput(hintText: hintText, iconData: iconData),
        TextBox(),
        PurpleButton(buttonText: buttonText, onPressed: onPressed)
      ],
    );
  }
}
