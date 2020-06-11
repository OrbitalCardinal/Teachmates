import 'package:flutter/material.dart';

Widget appBar({String texto, var color, var colorTexto}) {
    return PreferredSize(
      child: AppBar(
        elevation: 1.0,
        backgroundColor: color,
        leading: null, 
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            children: <Widget>[
              Text(texto, style: TextStyle(fontWeight: FontWeight.bold, color: colorTexto, fontSize: 25.0)),
            ],
          )
        ),
      ), 
      preferredSize: Size.fromHeight(60.0)
    );
  }