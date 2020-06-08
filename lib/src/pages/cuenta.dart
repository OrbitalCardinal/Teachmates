import 'package:flutter/material.dart';

import 'package:teachmate/src/pages/headers.dart';
import 'package:teachmate/src/preferencias_usuario/preferencias_usuario.dart';


class CuentaPage extends StatelessWidget {

  final _prefs = new PreferenciasUsuario();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xffF6F6F6),
            height: size.height*0.365,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text( 'Gerardo Coronado', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25.0),)
                ],
              ),
            ),
          ),
          HeaderAccountGradient(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Perfil', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0)),
                  IconButton(icon: Icon(Icons.edit, color: Colors.white, size: 25.0), onPressed: (){}) 
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: size.height*0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: CircleAvatar(
                      maxRadius: 54.0,
                      child: 
                        Image.network("https://scontent-mia3-2.xx.fbcdn.net/v/t1.0-9/55536510_2270410696612912_6627672482381824000_o.jpg?_nc_cat=102&_nc_sid=174925&_nc_oc=AQm-daHL314zIv5h4RgY7fzERxtyq069fCkNJCvHrrepy8w94OhMGzivp2w0yvSsoXM&_nc_ht=scontent-mia3-2.xx&oh=7768855d3938fa5a42d31af4bff0ab37&oe=5F03711B", height: size.width*0.331, width: size.width*0.331,)
                    ),
                    elevation: 5.0,
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: OutlineButton(
                      child: Text('Cerrar sesión'),
                      onPressed: () {
                        _prefs.token = null;
                        Navigator.pushReplacementNamed(context, 'login');
                      }
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),      
    );
  }
}