import 'package:flutter/material.dart';

class TextPersonal extends StatefulWidget {
  final String hint;
  Function onTap;
  //Icon icon;
  bool selected;

  TextPersonal({
    required this.selected,
    this.hint = "",
    //required this.icon,
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Selected();
  }
}

class _Selected extends State<TextPersonal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        onTap: () {
          widget.onTap.call();
          // setState(() {
          //   widget.selected = !widget.selected;
          // });
        },
        initialValue: widget.hint,
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15.0),
          filled: true,
          //  labelText: widget.hint,
          suffixIcon: IconButton(
              color: Colors.black,
              icon: widget.selected
                  ? const Icon(Icons.circle_rounded)
                  : const Icon(Icons.circle_outlined),
              onPressed: () {
                widget.onTap.call();
              }),
        ),
        style: const TextStyle(color: Colors.black54, fontFamily: 'Work Sans'),
      ),
    );
  }
}
