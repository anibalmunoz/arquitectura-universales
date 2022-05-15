import 'dart:developer';

import 'package:arquitectura_universales/pages/page_two/page_two.dart';
import 'package:arquitectura_universales/pages/test_pages/back_page.dart';
import 'package:arquitectura_universales/pages/test_pages/tittle_page.dart';
import 'package:arquitectura_universales/widgets/card_image.dart';
import 'package:arquitectura_universales/widgets/circle_button.dart';
import 'package:arquitectura_universales/widgets/profile_background.dart';
import 'package:arquitectura_universales/widgets/purple_button.dart';
import 'package:arquitectura_universales/widgets/text_box.dart';
import 'package:arquitectura_universales/widgets/text_personalizado.dart';
import 'package:arquitectura_universales/widgets/tittle_input.dart';
import 'package:arquitectura_universales/widgets/user_info.dart';
import 'package:arquitectura_universales/widgets/widget_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Prueba a text box", (WidgetTester tester) async {
    var widget = TextBox();
    tester.pumpWidget(MaterialApp(
      home: Scaffold(
          body: Container(
        child: widget,
      )),
    ));
  });

  testWidgets("Prueba de Pagina 2", (WidgetTester tester) async {
    const widget = PageTwo(
      title: "ninguno",
    );
    tester.pumpWidget(const MaterialApp(home: widget));
  });

  testWidgets("Prueba de Text", (WidgetTester tester) async {
    var widget = const Text("Tester");
    tester.pumpWidget(MaterialApp(home: widget));
  });

  testWidgets("Prueba de textPersonal", (WidgetTester tester) async {
    var widget = TextPersonal(selected: false, onTap: () {});

    tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
  });

  testWidgets("Test profile background", (WidgetTester tester) async {
    var widget = ProfileBackground();

    tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
  });

  testWidgets("Test profile tarjeta con imagen ", (WidgetTester tester) async {
    var widget = cardImage();

    tester.pumpWidget(
        MaterialApp(home: Scaffold(body: Container(child: widget))));
  });

  testWidgets("User info tarjeta con imagen ", (WidgetTester tester) async {
    var widget = UserInfo();

    tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body:
                Column(children: [Center(child: Container(child: widget))]))));
  });
  testWidgets("Test of Text box", (WidgetTester tester) async {
    var widget = TextBox();
    var widget2 = cardImage();

    tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: Column(children: [
        widget,
        widget2,
      ]),
    )));
  });

  testWidgets("Test of Purple_button", (WidgetTester tester) async {
    var widget = PurpleButton(
      onPressed: () {
        log('Test');
      },
      buttonText: "Test",
    );

    tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body:
                Column(children: [Center(child: Container(child: widget))]))));
  });
  testWidgets("Test of tittle_input", (WidgetTester tester) async {
    var widget = TittleInput(
      hintText: "Test",
      iconData: Icons.abc,
    );

    tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body:
                Column(children: [Center(child: Container(child: widget))]))));
  });

  testWidgets("Test of graddient button", (WidgetTester tester) async {
    var widget = GradientButton(onTap: () {}, content: null);
    tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body:
                Column(children: [Center(child: Container(child: widget))]))));
  });

  testWidgets("Test widgets simultaneos", (tester) async {
    var widget1 = TextBox();
    var widget2 = cardImage();
    var widget3 = PurpleButton(buttonText: "Test", onPressed: () {});
    tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: Column(children: [
      Center(
          child: Column(
        children: [
          Container(child: widget1),
          widget2,
          widget3,
        ],
      ))
    ]))));
  });

  testWidgets('Test Circle_button', (tester) async {
    var widget = CircleButton(
        false, Icons.access_alarm, 12.2, const Color(0xFFFF9000), () {});

    tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Container(child: widget),
      ),
    ));
  });

  testWidgets('Test TittlePage', (tester) async {
    var widget = TittlePage(
        hintText: "Test",
        iconData: Icons.abc,
        buttonText: "Test",
        onPressed: () {});

    tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: widget,
      ),
    ));
  });

  testWidgets('Test backPage', (tester) async {
    var widget = BackPage(
        hintText: 'Test',
        iconData: Icons.textsms_sharp,
        buttonText: 'Test',
        onPressed: () {
          print("Prueba de widget");
        },
        selected: true);

    tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: widget,
      ),
    ));
  });
}
