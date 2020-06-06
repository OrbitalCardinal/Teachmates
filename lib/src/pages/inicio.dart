import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _crearAppBar(),
      body: Center(
        child: Text('Inicio'),
      ),
    );
  }

  Widget _crearAppBar() {
    return PreferredSize(
      child: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Container(
          child: Text('Inicio', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0))
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Color(0xff5B5B5B), size: 25.0,),
            onPressed: () {

            }
          )
        ],
      ), 
      preferredSize: Size.fromHeight(60.0)
    );
  }
}