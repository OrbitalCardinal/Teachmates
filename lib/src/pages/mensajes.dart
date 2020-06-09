import 'package:flutter/material.dart';
import 'package:teachmate/src/models/chat_model.dart';
import 'package:teachmate/src/models/mensaje_model.dart';
import 'package:teachmate/src/models/salaChat_model.dart';
import 'package:teachmate/src/models/usuario_model.dart';
import 'package:teachmate/src/pages/chat.dart';
import 'package:teachmate/src/services/auth.dart';
import 'package:teachmate/src/widgets/appBar.dart';



class MensajesPage extends StatefulWidget {
  MensajesPage({this.usuarioInfo});
  Map<String, dynamic> usuarioInfo;
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
      body: Center(
        child: Column(
          children: <Widget>[
            Chats(widget.listaMensajes),
          ]
        )
      ),
    );
  }

Widget Chats(List<MensajeModel> mensajes) {
  return Expanded(
      child: Container(
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final ChatInfo chat = chats[index];
          final SalaChatModel sala = salas[index];
          List<MensajeModel> listaMensajes = [];
          dynamic nombre;
          String mensajeId;
          for(var n in usuarios) {
            if(n.id == sala.idUsuario) { 
              nombre = n.nombre;
            }
          }
          
          for(var mensaje in mensajes) {
            if(mensaje.idSalaChat == sala.id) {
              listaMensajes.add(mensaje);
              mensajeId = mensaje.mensajeId;
            }
          }
          
          MensajeModel ultimoMensaje = listaMensajes[listaMensajes.length - 1];
          
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage(usuario: nombre, listaMensajes: listaMensajes, sala: sala)));
              setState(() {
                for(var mensaje in widget.listaMensajes) {
                  if(mensajeId == mensaje.mensajeId) {
                    mensaje.leido = true;
                  }
                }
              });
            } ,
              child: Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey
                    )
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(radius: 25.0),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[   
                            Text(
                              nombre,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0)
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(
                                ultimoMensaje.idUsuario == miId  ? "Tu: " + ultimoMensaje.texto : ultimoMensaje.texto,
                                style: TextStyle(
                                  color: ultimoMensaje.leido || (ultimoMensaje.idUsuario == miId) ? Colors.blueGrey : Colors.black,
                                  fontSize: 13.0, 
                                  fontWeight: ultimoMensaje.leido ? FontWeight.normal : FontWeight.w500
                                  ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(children: <Widget>[
                      Text(
                        ultimoMensaje.fecha.hour.toString() + ':' + ultimoMensaje.fecha.minute.toString(),
                        style: TextStyle(
                          color: ultimoMensaje.idUsuario != miId ?  Colors.indigo[400] : Colors.grey
                          )
                        ),
                      Icon(
                        ultimoMensaje.idUsuario == miId ? Icons.check: Icons.fiber_manual_record, 
                        size: 15.0, 
                        color: ultimoMensaje.idUsuario != miId && ultimoMensaje.leido ? Colors.white : Colors.indigo[400]
                        )
                    ],)
                  ],
                ),
              ),
            ),
          );
        } 
      )
    ),
  );
}
}