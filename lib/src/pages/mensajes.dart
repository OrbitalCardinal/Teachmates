import 'package:flutter/material.dart';
import 'package:teachmate/src/models/chat_model.dart';
import 'package:teachmate/src/pages/chat.dart';





class MensajesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _crearAppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Chats(),
          ]
        )
      ),
    );
  }
  
  Widget _crearAppBar() {
    return PreferredSize(
      child: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Container(
          child: Text('Chats', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0))
        ),
      ),
      preferredSize: Size.fromHeight(60.0)
    );
  }
}

Widget Chats() {
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
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage(usuario: chat.nombre))),
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
                              chat.nombre,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0)
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(
                                chat.miMensaje  ? "Tu: " + chat.texto : chat.texto,
                                style: TextStyle(
                                  color: chat.leido ? Colors.blueGrey : Colors.black,
                                  fontSize: 13.0, 
                                  fontWeight: chat.leido ? FontWeight.normal : FontWeight.w500
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
                        chat.hora.hour.toString() + ':' + chat.hora.minute.toString(),
                        style: TextStyle(
                          color: !chat.leido ?  Colors.indigo[400] : Colors.grey
                          )
                        ),
                      Icon(
                        chat.miMensaje ? Icons.check: Icons.fiber_manual_record, 
                        size: 15.0, 
                        color: !chat.miMensaje && chat.leido ? Colors.white : Colors.indigo[400]
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