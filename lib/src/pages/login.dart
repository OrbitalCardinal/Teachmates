import 'package:flutter/material.dart';
import 'package:teachmate/src/pages/home.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Center(
                  child: Text('Teachmates', style: TextStyle(fontFamily: 'MontserratAlternates', fontSize: 40.0)
                  )
                ),
              )
            ),
            SizedBox(child: Container(height: 40.0,),),
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: const BorderSide( width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(13.0),
                          ),
                        ),
                        fillColor: Colors.white,
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        filled: true,
                        hintText: 'ejemplo@correo.com',
                        labelText: 'Correo electrónico',
                        labelStyle: TextStyle(color: Colors.black)
                      )
                    ),
                  ),
                  SizedBox(
                    child: Container(
                      height: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderSide: const BorderSide( width: 3.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(13.0),
                          ),
                        ),
                        fillColor: Colors.white,
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        filled: true,
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: Colors.black)
                      )
                    ),
                  ),
                  SizedBox(
                    child: Container(height: 30.0,)
                  ),
                  RaisedButton(
                    child: Container(
                      padding: EdgeInsets.symmetric( horizontal: 45.0, vertical: 20.0),
                      child: Text('Iniciar sesión', style: TextStyle(fontSize: 19.0),),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0)
                    ),
                    elevation: 0.0,
                    color: Colors.indigo[400],
                    textColor: Colors.white,
                    onPressed: () {Navigator.pushReplacementNamed(context, 'home');},
                  )
                ],
              ),
            ),
            SizedBox(child: Container(height: 25.0,)),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('¿No tienes una cuenta? '),
                  Text('Registrate', style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}