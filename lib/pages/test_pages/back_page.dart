import 'package:arquitectura_universales/widgets/purple_button.dart';
import 'package:arquitectura_universales/widgets/text_box.dart';
import 'package:arquitectura_universales/widgets/text_personalizado.dart';
import 'package:arquitectura_universales/widgets/tittle_input.dart';
import 'package:arquitectura_universales/widgets/user_info.dart';
import 'package:flutter/material.dart';

class BackPage extends StatelessWidget {
  String hintText;
  IconData iconData;
  String buttonText;
  VoidCallback onPressed;
  bool selected;

  BackPage({
    key,
    required this.hintText,
    required this.iconData,
    required this.buttonText,
    required this.onPressed,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TittleInput(hintText: hintText, iconData: iconData),
        TextBox(),
        PurpleButton(buttonText: buttonText, onPressed: onPressed),
        TittleInput(hintText: hintText, iconData: iconData),
        UserInfo(),
        TextPersonal(selected: selected, onTap: onPressed)
      ],
    );
  }
}
