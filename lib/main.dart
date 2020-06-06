import 'package:flutter/material.dart';
import 'package:teachmate/src/bloc/provider.dart';
import 'package:teachmate/src/pages/home.dart';
import 'package:teachmate/src/pages/login.dart';
import 'package:teachmate/src/pages/registro.dart';
import 'package:teachmate/src/preferencias_usuario/preferencias_usuario.dart';
 
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
    if(prefs.token != Null) {auth = 'home';} else { auth = 'login';}
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: auth,
        routes: {
          'login'    : (BuildContext context) => LoginPage(),
          'registro' : (BuildContext context) => RegistroPage(),
          'home'     : (BuildContext context) => HomePage()
        },
      ),
    );
  }
}