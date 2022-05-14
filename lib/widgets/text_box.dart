import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        //controller: _textEditingController,
        decoration: InputDecoration(
            filled: true,
            labelText: "",
            suffix: GestureDetector(
              child: Icon(Icons.close),
              // onTap: () {
              //   _textEditingController.clear();
              // },
            )),
      ),
    );
  }
}
