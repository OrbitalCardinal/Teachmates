import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teachmate/src/models/chat_model.dart';
import 'package:teachmate/src/models/mensaje_model.dart';
import 'package:teachmate/src/models/salaChat_model.dart';
import 'package:teachmate/src/models/usuario_model.dart';
import 'package:teachmate/src/pages/chat.dart';
import 'package:teachmate/src/providers/usuario_provider.dart';
import 'package:teachmate/src/services/auth.dart';
import 'package:teachmate/src/widgets/appBar.dart';



class MensajesPage extends StatefulWidget {
  MensajesPage({this.usuarioInfo});
  Map<String, dynamic> usuarioInfo;
  List<SalaChatModel> salasUsuario;
  List<MensajeModel> mensajesUsuario;
  @override
  _MensajesPageState createState() => _MensajesPageState();
  List<MensajeModel> listaMensajes = List.from(mensajes);
}

class _MensajesPageState extends State<MensajesPage> {
  int chatCounter = 0;
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: appBar(texto: "Chats", color: Colors.white, colorTexto: Colors.black),
      body: StreamBuilder(
        stream: Firestore.instance.collection('salaChat').where('miId', isEqualTo: widget.usuarioInfo['id']).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          }
          List<DocumentSnapshot> salas = snapshot.data.documents;
          List<SalaChatModel> tempSala = [];
          for(var s in salas) {
            tempSala.add(SalaChatModel(id: s.documentID.toString(), asesoria: s.data['asesoria'], miId: widget.usuarioInfo['id'], idUsuario: s.data['idUsuario']));
          }
          widget.salasUsuario = tempSala;
                    
          return StreamBuilder(
            stream: Firestore.instance.collection('mensaje').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
              if(!snap.hasData) {
                return Center(child: CircularProgressIndicator(),);
              }
              return Container(
                child: Column(
                  children: <Widget>[
                    Chats(widget.salasUsuario),
                  ],
                )
              );
            }
          );
        }
      ),
    );
  }

Widget Chats(List<SalaChatModel> salas) {
  return Expanded(
    child: Container(
      child: Container (
        height: 300.0,
        child: salas.length == 0 ? Container() : ListView.builder(
          itemCount: salas.length,
          itemBuilder: (BuildContext context, index) {
            return StreamBuilder(
              stream: Firestore.instance.collection('usuario').where('id', isEqualTo: widget.salasUsuario[index].idUsuario).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(!snapshot.hasData) {
                  return Container();
                }
                var usuarioChat = snapshot.data.documents[0];
                return StreamBuilder(
                  stream:  Firestore.instance.collection('mensaje').where('idSalaChat', isEqualTo: widget.salasUsuario[index].id).snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
                    if(!snap.hasData) {
                      return Container();
                    }
                    List<MensajeModel> mensajesChat = [];
                    for(var snap in snap.data.documents) {
                      mensajesChat.add(MensajeModel(mensajeId: snap.documentID, idSalaChat: snap.data['idSalaChat'], texto: snap.data['texto'], fecha: snap.data['fecha'], idUsuario: snap.data['idUsuario'], leido: snap.data['leido']));
                    }
                    mensajesChat.sort((a,b) => a.fecha.compareTo(b.fecha));
                    MensajeModel ultimoMensaje = mensajesChat[mensajesChat.length - 1];
                    String ultimoMensajeFecha = ultimoMensaje.fecha.toDate().hour.toString() + ":" + ultimoMensaje.fecha.toDate().minute.toString();
                    
                    return GestureDetector(
                      onTap: () {
                        
                        Firestore.instance.collection('salaChat').where('miId', isEqualTo: widget.salasUsuario[index].miId).getDocuments().then((value) {
                          Firestore.instance.collection('mensaje').where('idSalaChat', isEqualTo: value.documents[0].documentID).getDocuments().then((mensaje) {
                            Firestore.instance.collection('mensaje').document(mensaje.documents[mensaje.documents.length - 1].documentID).updateData({
                              'leido': true
                            }).then((onupdate) {
                              Firestore.instance.collection('salaChat').where('miId', isEqualTo: widget.salasUsuario[index].idUsuario).getDocuments().then((second) {
                                Firestore.instance.collection('mensaje').where('idSalaChat', isEqualTo: second.documents[0].documentID).getDocuments().then((secondMensaje) {
                                  Firestore.instance.collection('mensaje').document(secondMensaje.documents[secondMensaje.documents.length - 1].documentID).updateData({
                                    'leido': true
                                  }).then((finish) {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage(
                                      usuario: UsuarioModel(
                                        correo: usuarioChat['correo'],
                                        id: usuarioChat['id'],
                                        nombre: usuarioChat['nombre'],
                                        urlPhoto: usuarioChat['urlPhoto'],
                                        puntuacionAsesor: usuarioChat['puntuacionAsesor'],
                                        puntuacionAsesorado: usuarioChat['puntuacionAsesorado'],
                                        ocupacion: usuarioChat['ocupacion'],
                                        ), 
                                      listaMensajes: mensajesChat,
                                      sala: widget.salasUsuario[index], 
                                      usuarioInfo: widget.usuarioInfo, 
                                      urlUsuario: usuarioChat.data['urlPhoto'],
                                      sala2Id: second.documents[0].documentID,
                                      )));
                                  });
                                });
                              });
                               
                            });
                          });
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:Colors.grey
                              )
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: NetworkImage(usuarioChat.data['urlPhoto']),
                                  radius: 25.0
                                  ),
                              SizedBox(width: 10.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    usuarioChat['nombre'],
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0)
                                  ),
                                  SizedBox(height: 5.0,),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    child: Text(
                                      ultimoMensaje.idUsuario == widget.usuarioInfo['id'] ? 'Tu: ' + ultimoMensaje.texto : ultimoMensaje.texto,
                                      style: TextStyle(
                                        color: ultimoMensaje.leido || (ultimoMensaje.idUsuario == widget.usuarioInfo['id']) ? Colors.blueGrey : Colors.black ,
                                        fontSize: 13,
                                        fontWeight: ultimoMensaje.leido ?  FontWeight.normal : FontWeight.w500
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  )
                                ],
                              ),
                              ],),
                              Column(
                                children: <Widget>[
                                  Text(
                                    ultimoMensajeFecha,
                                    style: TextStyle(
                                      color: ultimoMensaje.idUsuario != widget.usuarioInfo['id'] ? Colors.indigo[400] : Colors.grey
                                    )
                                  ),
                                  Icon(
                                    ultimoMensaje.idUsuario == widget.usuarioInfo['id'] ?  Icons.check: Icons.fiber_manual_record,
                                    color: ultimoMensaje.idUsuario != widget.usuarioInfo['id'] && ultimoMensaje.leido ? Colors.white : Colors.indigo[400] ,
                                    size: 15
                                  )
                              ])
                            ],
                          )
                        )
                      ),
                    );
                  }
                );
              }
            );
          }
        )
      )
    )
  );
}
}