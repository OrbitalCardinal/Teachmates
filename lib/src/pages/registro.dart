import 'package:flutter/material.dart';

import 'package:teachmate/src/bloc/login_bloc.dart';
import 'package:teachmate/src/bloc/provider.dart';
import 'package:teachmate/src/pages/headers.dart';
import 'package:teachmate/src/providers/usuario_provider.dart';
import 'package:teachmate/src/utils/utils.dart';

class RegistroPage extends StatelessWidget {
  final usuarioProvider = new UsuarioProvider();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          HeaderWaveGradient(),
          SafeArea(
            child: Container(
              height: size.height*0.3,
              child: Center(
                child: Text('Teachmates', style: TextStyle(fontFamily: 'MontserratAlternates', color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.w500))),
            )
          ),
          _crearForm(context),
        ]
      ),
    );
  }

  Widget _crearForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            SafeArea(
              child: Container(
                height: 180.0,
              ),
            ),

            Container(
              width: size.width * 0.85,
              margin: EdgeInsets.symmetric(vertical: 30.0),
              padding: EdgeInsets.symmetric( vertical: 50.0 ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                    offset: Offset(0.0, 2.0),
                    spreadRadius: 0.5
                  )
                ]
              ),
              child: Column(
                children: <Widget>[
                 
                  _crearEmail( bloc ),
                  SizedBox( height: 30.0 ),
                  _crearPassword( bloc ),
                  SizedBox( height: 30.0 ),
                  _crearBoton( bloc )
                ],
              ),
            ),

                   FlatButton(
            child: Text('¿Ya tienes cuenta? Inicia sesión'),
            onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'),
          ),
            SizedBox( height: 10.0 )
          ],
        ),
      )
    );
  }

  Widget _crearEmail(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: new OutlineInputBorder(
               borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico',
            errorText: snapshot.error
          ),
          onChanged: bloc.changeEmail,
        ),

      );


      },
    );


  }

  Widget _crearPassword(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
              labelText: 'Contraseña',
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),

        );

      },
    );


  }

  Widget _crearBoton( LoginBloc bloc) {

    // formValidStream
    // snapshot.hasData
    //  true ? algo si true : algo si false

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 60.0, vertical: 15.0),
            child: Text('Continuar', style: TextStyle(fontSize: 18.0)),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0)
          ),
          elevation: 1.0,
          color: Colors.indigo[400],
          textColor: Colors.white,
          onPressed: snapshot.hasData ? ()=> _register(bloc, context) : null
        );
      },
    );
  }

  _register(LoginBloc bloc, BuildContext context) async {

    final info = await usuarioProvider.nuevoUsuario(bloc.email, bloc.password);

    if ( info['ok'] ) {
       Navigator.pushReplacementNamed(context, 'home');
    } else {
      mostrarAlerta( context, info['mensaje'] );
    }


    // Navigator.pushReplacementNamed(context, 'home');

  }
}