import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:arquitectura_universales/blocs/seguro_bloc/seguro_bloc.dart';
import 'package:arquitectura_universales/localizations/localization.dart';
import 'package:arquitectura_universales/main.dart';
import 'package:arquitectura_universales/model/seguro-model.dart';
import 'package:arquitectura_universales/providers/api_manager_seguro.dart';
import 'package:arquitectura_universales/util/app_string.dart';
import 'package:arquitectura_universales/util/app_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CreacionSeguro extends StatefulWidget {
  String titulo;

  CreacionSeguro({key, required this.titulo});

  @override
  State<StatefulWidget> createState() => _CreacionSeguro();
}

class _CreacionSeguro extends State<CreacionSeguro> {
  var _fechaInicioSeleccionada = DateTime.now();
  var _fechaVencimientoSeleccionada = DateTime.now();

  void callDatePicker(fecha) async {
    var selectedDate = await getDatePickerWidget();

    if (selectedDate != null && fecha == "fechainicio") {
      setState(() {
        _fechaInicioSeleccionada = selectedDate;
      });
      fechaInicioController.text =
          DateFormat('yyyy-MM-dd').format(_fechaInicioSeleccionada);
    }
    if (selectedDate != null && fecha == "fechavencimiento") {
      setState(() {
        _fechaVencimientoSeleccionada = selectedDate;
      });
      fechaVencimientoController.text =
          DateFormat('yyyy-MM-dd').format(_fechaVencimientoSeleccionada);
    }
  }

  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
        context: context,
        initialDate: _fechaInicioSeleccionada,
        firstDate: DateTime(2000),
        lastDate: DateTime(2023),
        builder: (context, child) {
          return Theme(
              data: MyApp.themeNotifier.value == ThemeMode.dark
                  ? ThemeData.dark()
                  : ThemeData.light(),
              child: child!);
        });
  }

  final _keyForm = GlobalKey<FormState>();
  final baseURL = const MyApp().baseURL;
  final pathURL = "/seguro/guardar";

  var ramoController = TextEditingController();
  var fechaInicioController = TextEditingController();
  var fechaVencimientoController = TextEditingController();
  var condicionesParticularesController = TextEditingController();
  var observacionesController = TextEditingController();

  bool guardando = false;

  final estiloBotonGuardar = ElevatedButton.styleFrom(
    primary: Colors.green,
    onPrimary: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  @override
  Widget build(BuildContext context) {
    Seguro seg = Seguro();

    AppLocalizations localizations =
        Localizations.of<AppLocalizations>(context, AppLocalizations)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyApp.themeNotifier.value == ThemeMode.light
            ? Colors.blue[900]
            : Colors.grey[900],
        bottom: const PreferredSize(
          preferredSize: Size(12, 12),
          child: Text(""),
        ),
        title: Text(
          widget.titulo,
          style: TextStyle(height: 4),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 37.0),
          ),
        ],
        leading: Container(
          margin: EdgeInsets.only(top: 22.0),
          child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
      body: guardando == true
          ? Center(
              child: Container(
              width: 30.0,
              height: 30.0,
              child: const CircularProgressIndicator(),
            ))
          : ListView(
              children: [
                Center(
                  child: SafeArea(
                      child: SingleChildScrollView(
                    child: SizedBox(
                        width: double.infinity,
                        child: Form(
                          key: _keyForm,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.security,
                                color: Colors.amber,
                                size: 150.0,
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormField(
                                      controller: ramoController,
                                      validator: (valor) {
                                        if (valor!.isEmpty) {
                                          return localizations
                                              .dictionary(Strings.campoVacio);
                                        }
                                        seg.ramo = valor;
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          icon: const Icon(
                                              Icons.text_fields_rounded),
                                          labelText: localizations.dictionary(
                                              Strings.condicionesParticulares),
                                          border: const OutlineInputBorder(),
                                          isDense: false,
                                          contentPadding:
                                              const EdgeInsets.all(10)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 15.0, bottom: 15.0),
                                    ),
                                    TextFormField(
                                      keyboardType: null,
                                      onTap: () {
                                        callDatePicker("fechainicio");
                                      },
                                      controller: fechaInicioController,
                                      validator: (valor) {
                                        if (valor!.isEmpty) {
                                          return localizations
                                              .dictionary(Strings.campoVacio);
                                        }
                                        seg.fechaInicio = valor;
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        icon: const Icon(Icons.date_range),
                                        labelText: localizations
                                            .dictionary(Strings.fechaInicio),
                                        //helperText: "Aa@45678",
                                        border: const OutlineInputBorder(),
                                        isDense: false,
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 15.0, bottom: 15.0),
                                    ),
                                    TextFormField(
                                      onTap: () {
                                        callDatePicker("fechavencimiento");
                                      },
                                      keyboardType: null,
                                      controller: fechaVencimientoController,
                                      validator: (valor) {
                                        if (valor!.isEmpty) {
                                          return localizations
                                              .dictionary(Strings.campoVacio);
                                        }
                                        seg.fechaVencimiento = valor;
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        icon: const Icon(Icons.date_range),
                                        labelText: localizations.dictionary(
                                            Strings.fechaVencimientoField),
                                        border: const OutlineInputBorder(),
                                        isDense: false,
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 15.0, bottom: 15.0),
                                    ),
                                    TextFormField(
                                      controller:
                                          condicionesParticularesController,
                                      validator: (valor) {
                                        if (valor!.isEmpty) {
                                          return localizations
                                              .dictionary(Strings.campoVacio);
                                        }
                                        seg.condicionesParticulares = valor;
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        icon: const Icon(
                                            Icons.read_more_outlined),
                                        labelText: localizations
                                            .dictionary(Strings.claseVia),
                                        border: const OutlineInputBorder(),
                                        isDense: false,
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 15.0, bottom: 15.0),
                                    ),
                                    TextFormField(
                                      controller: observacionesController,
                                      validator: (valor) {
                                        if (valor!.isEmpty) {
                                          return localizations
                                              .dictionary(Strings.campoVacio);
                                        }
                                        seg.observaciones = valor;
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        icon: const Icon(Icons.folder),
                                        labelText: localizations
                                            .dictionary(Strings.observaciones),
                                        border: const OutlineInputBorder(),
                                        isDense: false,
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        style: estiloBotonGuardar,
                                        onPressed: () {
                                          if (_keyForm.currentState!
                                              .validate()) {
                                            guardarSeguro(context, seg)
                                                .then((value) {
                                              if (value) {
                                                mostrarCarga(context);
                                                Navigator.pop(context);
                                              }
                                            });
                                          }
                                        },
                                        child: Text(localizations.dictionary(
                                            Strings.botonGuardarSeguro)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  )),
                ),
                // Row(
                //   children: [],
                // )
              ],
            ),
    );
  }

  Future<bool> guardarSeguro(context, seguro) async {
    AppLocalizations localizations =
        Localizations.of<AppLocalizations>(context, AppLocalizations)!;
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(localizations.dictionary(Strings.botonGuardar)),
              content:
                  Text(localizations.dictionary(Strings.consultaGuardarSeguro)),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text(localizations.dictionary(Strings.botonCancelar),
                        style: const TextStyle(
                          color: Colors.blue,
                        ))),
                BlocProvider(
                  create: (context) => SeguroBloc(),
                  child: BlocListener<SeguroBloc, SeguroState>(
                    listener: (context, state) {
                      switch (state.runtimeType) {
                        case GuardandoSeguroState:
                          //mostrarCarga(context);
                          break;
                        case SeguroGuardadoState:
                          //mostrarCarga(context);

                          break;
                      }
                    },
                    child: BlocBuilder<SeguroBloc, SeguroState>(
                      builder: (context, state) {
                        return TextButton(
                            onPressed: () {
                              if (MyApp.conectedToNetwork) {
                                Map<String, dynamic> bodyMap;
                                bodyMap = {
                                  "ramo": seguro.ramo,
                                  "fechaInicio": seguro.fechaInicio,
                                  "fechaVencimiento": seguro.fechaVencimiento,
                                  "condicionesParticulares":
                                      seguro.condicionesParticulares,
                                  "obervaciones": seguro.observaciones,
                                };

                                var jsonMap = json.encode(bodyMap);

                                print(
                                    "EL CLIENTE QUE ESTOY MANDANDO ES:  ${jsonMap}");

                                ApiManagerSeguro.shared.request(
                                  baseUrl: baseURL,
                                  pathUrl: pathURL,
                                  jsonParam: jsonMap,
                                  bodyParams: bodyMap,
                                  type: HttpType.POST,
                                  seguro: seguro,
                                );

                                ramoController.clear();
                                fechaInicioController.clear();
                                fechaVencimientoController.clear();
                                condicionesParticularesController.clear();
                                observacionesController.clear();

                                BlocProvider.of<SeguroBloc>(context)
                                    .add(ModificarSeguroEvent());

                                Navigator.pop(context, true);
                              } else {
                                mostrarFlushbar(context);
                              }
                            },
                            child: Text(
                              localizations.dictionary(Strings.botonConfirmar),
                              style: const TextStyle(color: Colors.green),
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ));
  }

  mostrarCarga(context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return const Dialog(
            child: LinearProgressIndicator(),
          );
        });
  }

  mostrarFlushbar(context) async {
    AppLocalizations localizations =
        Localizations.of<AppLocalizations>(context, AppLocalizations)!;
    if (!MyApp.conectedToNetwork) {
      Flushbar(
        title: localizations.dictionary(Strings.flushbarSinconexion),
        message:
            localizations.dictionary(Strings.flushbarNoPuedesRegistrarseguro),
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.only(top: 8, bottom: 55.0, left: 8, right: 8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
    }
  }
}
