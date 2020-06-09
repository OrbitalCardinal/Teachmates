import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teachmate/src/models/usuario_model.dart';
import 'package:teachmate/src/services/auth.dart';
import 'package:teachmate/src/widgets/appBar.dart';
import 'package:teachmate/src/widgets/tarjeta_vertical.dart';

class InicioPage extends StatefulWidget {
  InicioPage({this.usuarioInfo});
  Map<String, dynamic> usuarioInfo;
  
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    final double itemHeight = size.height / 4;
    final double itemWidth = size.width / 1.8;
    return Scaffold(
      appBar: appBar(texto: "Inicio", color: Colors.white, colorTexto: Colors.black),
      body: StreamBuilder(
              stream: Firestore.instance.collection('usuario').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator(),);
                }
                List<DocumentSnapshot> docs = snapshot.data.documents;
                return Container(
                  child: GridView.count(
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: (itemHeight/ itemWidth),
                    crossAxisCount: 2,
                    children: List.generate(docs.length, (index) {
                      Map<String, dynamic> data = docs[index].data;
                      UsuarioModel usuario = UsuarioModel(id: data['id'], correo: data['correo'], nombre: data['nombre'], urlPhoto: data['urlPhoto'], ocupacion: data['ocupacion'], puntuacionAsesor: data['puntuacionAsesor'], puntuacionAsesorado: data['puntuacionAsesorado']);
                      return crearTarjetaVertical(usuario);
                                }
                              ),
                      ),
                  );
              } 
      )
    );
  }
}