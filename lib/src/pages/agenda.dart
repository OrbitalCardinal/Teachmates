import 'package:flutter/material.dart';
import 'package:teachmate/src/models/asesoria_model.dart';
import 'package:teachmate/src/services/auth.dart';
import 'package:teachmate/src/widgets/appBar.dart';
import 'package:teachmate/src/widgets/tarjeta_horizontal.dart';

class AgendaPage extends StatelessWidget {
  AgendaPage({this.usuarioInfo});
  Map<String, dynamic> usuarioInfo;
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    final double itemHeight = size.height / 0.775;
    final double itemWidth = size.width / 1;
    return Scaffold(
      appBar: appBar(texto: "Asesorías pendientes", color: Colors.white, colorTexto: Colors.black),
      body: Container(
        child: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: (itemHeight/ itemWidth),
          crossAxisCount: 1,
          children: List.generate(asesorias.length, (index) {
            return crearTarjetaHorizontal();
          }
        ),
      )
      )
    );
  }

}
