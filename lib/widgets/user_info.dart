import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userPhoto = Container(
      width: 90.0,
      height: 90.0,
      margin: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
          shape: BoxShape.circle,
          image: const DecorationImage(
              fit: BoxFit.cover, //image: AssetImage(user.fotoURL)
              image: AssetImage('assets/img/paisaje1.jpg'))),
    );

    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Flexible(            child:

        Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            child: const Text('',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Lato',
                ))
            //)
            ),
        const Text('',
            style: TextStyle(
                fontSize: 15.0, color: Colors.white30, fontFamily: 'Lato')),
      ],
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
      child: Column(
        children: <Widget>[userPhoto, userInfo],
      ),
    );
  }
}
