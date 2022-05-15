import 'package:flutter/material.dart';

class cardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 70.0),
      height: 220.0,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/img/paisaje1.jpg')),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: Colors.transparent,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0))
          ]),
    );
  }
}
