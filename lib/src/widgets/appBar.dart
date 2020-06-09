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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Color(0xff5B5B5B), size: 30.0,),
            onPressed: () {
            }
          )
        ],
      ), 
      preferredSize: Size.fromHeight(60.0)
    );
  }