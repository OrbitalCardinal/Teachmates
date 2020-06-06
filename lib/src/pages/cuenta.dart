import 'package:flutter/material.dart';
import 'package:teachmate/src/preferencias_usuario/preferencias_usuario.dart';

class CuentaPage extends StatelessWidget {
  final _prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlineButton(
          child: Text('Cerrar sesión'),
          onPressed: () {
             _prefs.token = null;
             Navigator.popAndPushNamed(context, 'login');
          }
        ),
      ),
    );
  }
}