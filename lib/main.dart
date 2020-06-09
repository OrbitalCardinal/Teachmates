import 'package:flutter/material.dart';

import 'package:teachmate/src/bloc/provider.dart';
import 'package:teachmate/src/pages/home.dart';
import 'package:teachmate/src/pages/iniciarSesion.dart';
import 'package:teachmate/src/pages/registro.dart';
import 'package:teachmate/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:teachmate/src/services/auth.dart';
 
void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print( prefs.token );
    String auth;
    if(prefs.token != null) {auth = 'home';} else { auth = 'login';}
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teachmates',
        initialRoute: 'iniciarSesion',
        routes: {
          'iniciarSesion': (BuildContext context) => IniciarSesionPage(auth: Auth()),
          'registro' : (BuildContext context) => RegistroPage(),
          'home'     : (BuildContext context) => HomePage(auth: Auth())
        },
      ),
    );
  }
}