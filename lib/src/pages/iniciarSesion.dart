import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teachmate/src/pages/crearCuenta.dart';
import 'package:teachmate/src/pages/headers.dart';
import 'package:teachmate/src/pages/home.dart';
import 'package:teachmate/src/services/auth.dart';

class IniciarSesionPage extends StatefulWidget {
  IniciarSesionPage({this.auth});
  BaseAuth auth;
  @override
  _IniciarSesionPageState createState() => _IniciarSesionPageState();
}

class _IniciarSesionPageState extends State<IniciarSesionPage> {

  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HeaderWaveGradient(),
          SafeArea(
            child: Center(
                child: Container( 
                  margin: EdgeInsets.only(top: size.height*0.05),
                  width: size.width*0.85,
                  child: SingleChildScrollView(
                      child: Column(
                      children: <Widget>[
                        Text('Teachmates', style: TextStyle(fontFamily: 'MontserratAlternates', color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.w500)),
                        SizedBox(height: size.height*0.05),
                        Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
                            TextFormField(
                              validator: (input) {
                                if(input.isEmpty) { 
                                  return 'Debe ingresar un correo';
                                }
                              },
                              onSaved: (input) => _email = input,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Correo electrónico"
                              ),
                            ),
                            SizedBox(height: size.height*0.05),
                            TextFormField(
                              obscureText: true,
                              validator: (input) {
                                if(input.length < 6 ) { 
                                  return 'La constraseña debe contener un minimo de 6 caracteres';
                                }
                              },
                              onSaved: (input) => _password = input,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Contraseña"
                              )
                            )
                          ],)
                        ),
                        SizedBox(height: size.height*0.05),
                        RaisedButton(
                          child: Text(
                            "Iniciar sesión",
                            style: TextStyle( fontSize: 15.0,color: Colors.white),
                            ),
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.blue[600],
                          onPressed: () {
                            iniciarSesion();
                          }
                        ),
                        SizedBox(height: size.height*0.15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "¿No tienes una cuenta?",  
                            ),
                            SizedBox(width: size.width*0.03),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => CrearCuentaPage(auth: widget.auth,)));
                              },
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Text(
                                  "Registrate",
                                  style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: size.height*0.05),
                        Column(
                          children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            Text(
                              "O accede con redes sociales",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              )
                          ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                child: Text(
                                  "Facebook",
                                  style: TextStyle(color: Colors.white),
                                  ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                color: Colors.blue,
                                onPressed: () {},
                              ),
                              SizedBox(width: size.width*0.05),
                              RaisedButton(
                                child: Text(
                                  "Google",
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                color: Colors.red,
                                onPressed: () {},
                              )
                            ],
                          )
                        ],)
                      ],
                    ),
                  ),
                ),
            )
          ),
          
        ]
      ),
    );
  }
  
  Future<void> iniciarSesion() async {
    final formState = _formKey.currentState;
    if(formState.validate()) { 
      formState.save();
      try {
        String userId = await widget.auth.iniciarSesion(_email, _password);
        print(userId);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(auth: widget.auth))); 
      } catch(e) {
        print(e);
      }
    }
  }
}