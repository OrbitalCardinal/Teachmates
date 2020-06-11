import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teachmate/src/models/mensaje_model.dart';
import 'package:teachmate/src/models/salaChat_model.dart';
import 'package:teachmate/src/models/usuario_model.dart';
import 'package:teachmate/src/pages/chat.dart';

class AsesorPage extends StatefulWidget {
  AsesorPage({
    this.asesor,
    this.usuarioInfo
  });
  UsuarioModel asesor;
  Map<String, dynamic> usuarioInfo;
  
  @override
  _AsesorPageState createState() => _AsesorPageState();
}

class _AsesorPageState extends State<AsesorPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget> [
          Container(
            color:  Colors.indigo[300],
            child: Column(
              children: <Widget> [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget> [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(widget.asesor.urlPhoto),
                        )
                      ]
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start ,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                widget.asesor.nombre,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color:  Colors.white
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                widget.asesor.ocupacion,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white
                                )
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          ClipOval(
                            child: Material(
                              color: Colors.white,
                              child: InkWell(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.message,
                                    color: Colors.indigo[300]
                                    ),
                                ),
                                onTap: () {
                                  Firestore.instance.collection('salaChat').getDocuments().then((salaDocs)  {
                                    bool existe = false;
                                    String salaId;
                                    bool asesoria = false;
                                    for(var i in salaDocs.documents) {
                                      if(i.data['miId'] == widget.usuarioInfo['id'] && i.data['idUsuario'] == widget.asesor.id) {
                                        existe = true;
                                        salaId = i.documentID;
                                        asesoria = i.data['asesoria'];
                                        break;
                                      }
                                    }
                                      
                                    if(!existe) {
                                      Firestore.instance.collection('salaChat').add({
                                       'asesoria': false,
                                       'idUsuario': widget.asesor.id,
                                       'miId': widget.usuarioInfo['id'] 
                                      }).then((sala) {
                                        Firestore.instance.collection('salaChat').add({
                                       'asesoria': false,
                                       'idUsuario': widget.usuarioInfo['id'] ,
                                       'miId': widget.asesor.id
                                      }).then((onDouble) {
                                        Firestore.instance.collection('mensaje').add({
                                          'fecha': Timestamp.now(),
                                          'idSalaChat': sala.documentID,
                                          'idUsuario': widget.usuarioInfo['id'],
                                          'leido': false,
                                          'texto': "Hola, me interesan tus servicios!"
                                        }).then((mensajeInicial) {
                                          
                                          Firestore.instance.collection('mensaje').add({
                                          'fecha': Timestamp.now(),
                                          'idSalaChat': onDouble.documentID,
                                          'idUsuario': widget.usuarioInfo['id'],
                                          'leido': false,
                                          'texto': "Hola, me interesan tus servicios!"
                                          }).then((doubleMensaje) {
                                            List<MensajeModel> nuevoMensaje = [
                                            MensajeModel(
                                              fecha: Timestamp.now(), 
                                              idSalaChat: sala.documentID, 
                                              texto: 'Hola, me interesan tus servicios!',
                                              mensajeId: mensajeInicial.documentID,
                                              idUsuario: widget.usuarioInfo['id'],
                                              leido: false
                                            )
                                          ];
                                          Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage(
                                            usuario: widget.asesor,
                                            listaMensajes:  nuevoMensaje,
                                            sala: SalaChatModel(
                                              id: sala.documentID,
                                              asesoria: false,
                                              miId: widget.usuarioInfo['id'],
                                              idUsuario: widget.asesor.id
                                            ),
                                            usuarioInfo: widget.usuarioInfo,
                                          )));
                                          });
                                        });
                                      });    
                                    });
                                    } else {
                                      Firestore.instance.collection('mensaje').where('idSalaChat', isEqualTo: salaId).getDocuments().then((mensajes) {
                                        List<MensajeModel> listaMensajes = [];
                                        for(var m in mensajes.documents) {
                                          listaMensajes.add(MensajeModel(
                                            mensajeId: m.documentID,
                                            idSalaChat: m.data['idSalaChat'],
                                            idUsuario: m.data['idUsuario'],
                                            leido: m.data['leido'],
                                            texto: m.data['texto'],
                                            fecha: Timestamp.now()
                                          ));
                                        }
                                        
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage(
                                            usuario: widget.asesor,
                                            listaMensajes:  listaMensajes,
                                            sala: SalaChatModel(
                                              id: salaId,
                                              asesoria: asesoria,
                                              miId: widget.usuarioInfo['id'],
                                              idUsuario: widget.asesor.id
                                            ),
                                            usuarioInfo: widget.usuarioInfo,
                                            urlUsuario: widget.asesor.urlPhoto,
                                        )));
                                        
                                      });
                                    }
                                  });
                                },
                              ),

                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height *0.01),
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                
                Text(
                  'Información',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                Text(widget.asesor.puntuacionAsesor.toString() + "★")
              ],),
              SizedBox(height: 10.0,),
              Row(children: <Widget>[
                Text(widget.asesor.info)
              ],),
              SizedBox(height: 10.0),
            ],),
          )
        ]
      )
    );
  }
}