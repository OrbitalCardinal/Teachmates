import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> iniciarSesion(String _email, String _password);
  Future<String> registrarse(String name, String email, String password);
  Future<String> currentUser();
  Future<String> hola();
}

class Auth implements BaseAuth {
  
  Future<String> iniciarSesion(String _email, String _password) async {
      FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
      return user.uid;
  }
  
  Future<String> registrarse(String name, String email, String password) async {
    AuthResult result = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password));
    await Firestore.instance.collection('usuario')
      .document()
      .setData({
        'correo': email,
        'nombre': name,
        'ocupacion': '',
        'puntuacionAsesor': 0.1,
        'puntuacionAsesorado': 0.1,
        'urlPhoto': '',
        'id': result.user.uid
      });
    return result.user.uid;
  }
  
  Future<String> currentUser()  async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }
  
  Future<String> hola() async {
    return "Hola";
  }
}