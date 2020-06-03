import 'package:flutter/material.dart';

import 'package:teachmate/src/pages/agenda.dart';
import 'package:teachmate/src/pages/busqueda.dart';
import 'package:teachmate/src/pages/cuenta.dart';
import 'package:teachmate/src/pages/home.dart';
import 'package:teachmate/src/pages/inicio.dart';
import 'package:teachmate/src/pages/login.dart';
import 'package:teachmate/src/pages/mensajes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teachmates',
      initialRoute: 'login',
      routes: {
        'login'   : (BuildContext context) => LoginPage(),
        'home'    : (BuildContext context) => HomePage(),
        'incio'   : (BuildContext context) => InicioPage(),
        'agenda'  : (BuildContext context) => AgendaPage(),
        'mensajes': (BuildContext context) => MensajesPage(),
        'cuenta'  : (BuildContext context) => CuentaPage(),
        'busqueda': (BuildContext context) => BusquedaPage()
      },
      theme: ThemeData(
        primaryColor: Colors.indigo[400],
      ),
    );
  }
}