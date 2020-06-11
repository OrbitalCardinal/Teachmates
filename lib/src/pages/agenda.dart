import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teachmate/src/models/asesoria_model.dart';
import 'package:teachmate/src/services/auth.dart';
import 'package:teachmate/src/widgets/appBar.dart';
import 'package:teachmate/src/widgets/tarjeta_horizontal.dart';

class AgendaPage extends StatefulWidget {
  AgendaPage({this.usuarioInfo});
  Map<String, dynamic> usuarioInfo;

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    final double itemHeight = size.height / 0.775;
    final double itemWidth = size.width / 1;
    return Scaffold(
      appBar: appBar(texto: "Asesorías pendientes", color: Colors.white, colorTexto: Colors.black),
      body: Container(
        child: StreamBuilder(
          stream: Firestore.instance.collection('asesoria').where('miId', isEqualTo: widget.usuarioInfo['id']).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData) {
              return Center(child: CircularProgressIndicator(),);
            }
            
            List<DocumentSnapshot> asesorias = snapshot.data.documents;
            
            return ListView.builder(
              itemCount: asesorias.length,
              itemBuilder: (context, index) {
                  return crearTarjetaHorizontal(AsesoriaModel(
                    miId: asesorias[index].data['miId'],
                    fecha: asesorias[index].data['fecha'],
                    idUsuario: asesorias[index].data['idUsuario'],
                    materia: asesorias[index].data['materia']
                  ));
              }
            );
            // GridView.count(
            //   padding: const EdgeInsets.all(20),
            //   crossAxisSpacing: 15,
            //   mainAxisSpacing: 15,
            //   childAspectRatio: (itemHeight/ itemWidth),
            //   crossAxisCount: 1,
            //   children: List.generate(asesorias.length, (index) {
            //     return crearTarjetaHorizontal();
            //   }
            // ),
            // );
          }
        )
      )
    );
  }
}
