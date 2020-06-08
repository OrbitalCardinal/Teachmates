import 'package:shared_preferences/shared_preferences.dart';

/*
  Recordar instalar el paquete de:
    shared_preferences:

  Inicializar en el main
    final prefs = new PreferenciasUsuario();
    prefs.initPrefs();

*/

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET de la última página
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token( String value ) {
    _prefs.setString('token', value);
  }

  get id {
    return _prefs.getString('id') ?? '';
  }

  set id( String value ) {
    _prefs.setString('id', value);
  }

    get nombre {
    return _prefs.getString('id') ?? '';
  }

  set nombre( String value ) {
    _prefs.setString('id', value);
  }

    get urlPhoto {
    return _prefs.getString('id') ?? '';
  }

  set urlPhoto( String value ) {
    _prefs.setString('id', value);
  }

}

