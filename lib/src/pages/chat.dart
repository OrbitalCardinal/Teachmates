import 'package:flutter/material.dart';
import 'package:teachmate/src/models/mensaje_model.dart';
import 'package:teachmate/src/models/salaChat_model.dart';
import 'package:teachmate/src/pages/agendar.dart';

class ChatPage extends StatefulWidget {
  final String usuario;
  final List<MensajeModel> listaMensajes;
  final SalaChatModel sala;
  ChatPage({
    this.usuario,
    this.listaMensajes,
    this.sala
    });
  
  @override
  _ChatPageState createState() => _ChatPageState();
}
String miId = "1";
class _ChatPageState extends State<ChatPage> {  
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                CircleAvatar(radius: 20.0),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(
                  widget.usuario,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500
                    )
                ),
                Text(
                  widget.sala.asesoria ? "Asesoría pendiente": "Sin asesoría agendada",
                  style: TextStyle(
                    color: widget.sala.asesoria ? Colors.green : Colors.grey, 
                    fontSize: 14.0),
                ),
                ],)    
              ],)         
          ],)
        ),
        
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              padding: EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.book,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      widget.sala.asesoria ? "Cancelar" : "Agendar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              color: widget.sala.asesoria ? Colors.red: Colors.green,
              onPressed: () {
                widget.sala.asesoria ? _dialogoCancelacion() :Navigator.push(context, MaterialPageRoute(builder: (_) => AgendarPage(asesor: widget.usuario)));
            },),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ClipRRect(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      padding: EdgeInsets.only(top: 15.0),
                      itemCount: widget.listaMensajes.length,
                      itemBuilder: (BuildContext context, int index) {
                        final MensajeModel mensaje = widget.listaMensajes[widget.listaMensajes.length-1-index];
                        return cajaMensaje(mensaje);
                      },
                  ),
                ),
            ),
          ),
          barraMensajes(widget.listaMensajes, widget.sala)
        ],
      ),
      
    );
  }
  
  cajaMensaje(MensajeModel mensaje) {
  return Container(
    margin: miId == mensaje.idUsuario ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0, right: 10.0): EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0, left: 10.0),
    padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(13.0)),
        color: miId != mensaje.idUsuario ? Colors.indigo[400] : Colors.grey[300],
    ),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              mensaje.texto,
              style: TextStyle(
                color: miId == mensaje.idUsuario ? Colors.black : Colors.white,
                fontSize: 15.0
                ) 
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              mensaje.fecha.hour.toString() + ':' + mensaje.fecha.minute.toString(),
              style: TextStyle(
                color: miId == mensaje.idUsuario ? Colors.black : Colors.white
                ) 
              ),
          ],
        ),
      ],
    )
  );
}

barraMensajes(List<MensajeModel> listaMensajes, SalaChatModel sala) {
  final controller = TextEditingController();
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
    height: 60.0,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: Colors.grey[350]
        )
      )
    ),
    child: Row(
      children: <Widget>[
        Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[350],
              hintText: "Escribe un mensaje...",
              hintStyle: TextStyle(
                color: Colors.grey[800],
                fontStyle: FontStyle.italic,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[350]),
                borderRadius: BorderRadius.circular(20.0)
              )
              ), 
            
          ),
        ),
        IconButton(
          icon: Icon(Icons.send), 
          color: Colors.indigo[300],
          iconSize: 30.0,
          onPressed: () {
            setState(() {
              listaMensajes.add(MensajeModel(idSalaChat: sala.id, texto: controller.text, fecha: DateTime.now(), idUsuario: miId, leido: false));              
              _controller.jumpTo(_controller.position.minScrollExtent);
            });  
            controller.clear();
          },),
      ],
    )
  );
  }
  
  void _dialogoCancelacion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Cancelación de asesoría"),
          content: Text("¿Estas seguro que quieres cancelar la asesoría?"),
          actions: <Widget>[
            RaisedButton(
              color: Colors.grey,
              child: Text(
                "Regresar",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              color: Colors.red,
              child: Text(
                "Cancelar",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  widget.sala.asesoria = false;
                });
              },
            )
          ]
        );
      }
      );
  }
}
