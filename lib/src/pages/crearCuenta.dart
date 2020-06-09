import 'package:flutter/material.dart';
import 'package:teachmate/src/pages/home.dart';
import 'package:teachmate/src/pages/iniciarSesion.dart';
import 'package:teachmate/src/services/auth.dart';

class CrearCuentaPage extends StatefulWidget {
  CrearCuentaPage({this.auth});
  BaseAuth auth;
  @override
  _CrearCuentaPageState createState() => _CrearCuentaPageState();
}

class _CrearCuentaPageState extends State<CrearCuentaPage> {
  String _email, _password, _name;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Center(
                child: Container( 
                  margin: EdgeInsets.only(top: size.height*0.05),
                  width: size.width*0.85,
                  child: SingleChildScrollView(
                      child: Column(
                      children: <Widget>[
                        Text('Teachmates', style: TextStyle(fontFamily: 'MontserratAlternates', color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.w500)),
                        SizedBox(height: size.height*0.05),
                        Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
                            TextFormField(
                              validator: (input) {
                                if(input.isEmpty) { 
                                  return 'Debe ingresar un nombre';
                                }
                              },
                              onSaved: (input) => _name = input,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Nombre",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0
                                  ),
                                  borderRadius: BorderRadius.circular(15.0)
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.indigo[600]
                                  ),
                                  borderRadius: BorderRadius.circular(15.0)
                                )
                              ),
                            ),
                            SizedBox(height: size.height*0.05),
                            TextFormField(
                              validator: (input) {
                                if(input.length < 6 ) { 
                                  return 'La constraseña debe contener un minimo de 6 caracteres';
                                }
                              },
                              onSaved: (input) => _email = input,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Correo electrónico",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0
                                  ),
                                  borderRadius: BorderRadius.circular(15.0)
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.indigo[600]
                                  ),
                                  borderRadius: BorderRadius.circular(15.0)
                                )
                              ),
                            ),
                            SizedBox(height: size.height*0.05),
                            TextFormField(
                              obscureText: true,
                              validator: (input) {
                                if(input.isEmpty) { 
                                  return 'Debe ingresar una contraseña';
                                }
                              },
                              onSaved: (input) => _password = input,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Constraseña",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0
                                  ),
                                  borderRadius: BorderRadius.circular(15.0)
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.indigo[600]
                                  ),
                                  borderRadius: BorderRadius.circular(15.0)
                                )
                              ),
                            ),
                            SizedBox(height: size.height*0.05),
                            RaisedButton(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              child: Text(
                                "Registrarse",
                                style: TextStyle(fontSize: 17.0, color: Colors.white)
                              ),
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              onPressed: () {
                                registrarse();
                              })
                          ],)
                        ),
                        SizedBox(height: size.height*0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Text("¿Ya tienes una cuenta?"),
                          SizedBox(width: size.width*0.03),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => IniciarSesionPage(auth: widget.auth,)));
                            },
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Text(
                                "Iniciar sesion",
                                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                            ),
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
  
  Future<void> registrarse() async {
    final formState = _formKey.currentState;
    if(formState.validate()) { 
      formState.save();
      try {
        String userId = await widget.auth.registrarse(_name, _email, _password);
        print(userId);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(auth: widget.auth))); 
      } catch(e) {
        print(e);
      }
    }
  }
  
  
}