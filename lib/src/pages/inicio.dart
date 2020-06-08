import 'package:flutter/material.dart';
import 'package:teachmate/src/widgets/tarjeta_vertical.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    final double itemHeight = size.height / 4;
    final double itemWidth = size.width / 1.8;
    return Scaffold(
      appBar: _crearAppBar(),
      body: Container(
        child: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: (itemHeight/ itemWidth),
          crossAxisCount: 2,
          children: <Widget>[
            crearTarjetaVertical(),
            crearTarjetaVertical(),
            crearTarjetaVertical(),
            crearTarjetaVertical(),
            crearTarjetaVertical(),
            crearTarjetaVertical(),
          ],
        ),
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
            icon: Icon(Icons.search, color: Color(0xff5B5B5B), size: 30.0,),
            onPressed: () {

            }
          )
        ],
      ), 
      preferredSize: Size.fromHeight(60.0)
    );
  }
}