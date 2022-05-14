import 'package:arquitectura_universales/pages/settings_page/settings_page.dart';
import 'package:arquitectura_universales/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Prueba a lista de clientes vacía", (WidgetTester tester) async {
    var widget = TextBox();
    tester.pumpWidget(MaterialApp(
      home: Scaffold(
          body: Container(
        child: widget,
      )),
    ));
  });

  // testWidgets("Prueba de Container", (WidgetTester tester) async {
  //   var widget = SettingsPage();
  //   tester.pumpWidget(MaterialApp(
  //     home: Scaffold(
  //         body: Container(
  //       child: widget,
  //     )),
  //   ));
  // });
}
