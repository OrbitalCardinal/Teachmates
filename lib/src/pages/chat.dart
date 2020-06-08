import 'package:flutter/material.dart';
import 'package:teachmate/src/models/chat_model.dart';
import 'package:teachmate/src/pages/agendar.dart';

class ChatPage extends StatefulWidget {
  final String usuario;
  ChatPage({this.usuario});
  
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
                  "Asesoria",
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
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
                      "Agendar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              color: Colors.green,
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => AgendarPage(asesor: widget.usuario)));
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
                      padding: EdgeInsets.only(top: 15.0),
                      itemCount: chats.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ChatInfo chatInfo = chats[index];
                        bool miMensaje =  chatInfo.miMensaje;
                        return cajaMensaje(chatInfo, miMensaje);
                   },
                  ),
                ),
            ),
          ),
          barraMensajes()
        ],
      ),
      
    );
  }
}

cajaMensaje(ChatInfo chatInfo, bool miMensaje) {
  return Container(
    margin: miMensaje ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0, right: 10.0): EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0, left: 10.0),
    padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(13.0)),
        color: !miMensaje ? Colors.indigo[400] : Colors.grey[300],
    ),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              chatInfo.texto,
              style: TextStyle(
                color: miMensaje ? Colors.black : Colors.white,
                fontSize: 15.0
                ) 
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              chatInfo.hora.hour.toString() + ':' + chatInfo.hora.minute.toString(),
              style: TextStyle(
                color: miMensaje ? Colors.black : Colors.white
                ) 
              ),
          ],
        ),
      ],
    )
  );
}
barraMensajes() {
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
          onPressed: () {  },),
      ],
    )
  );
}