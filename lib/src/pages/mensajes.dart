import 'package:flutter/material.dart';

class MensajesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _crearAppBar(),
      body: Center(
        child: Text('Mensajes'),
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