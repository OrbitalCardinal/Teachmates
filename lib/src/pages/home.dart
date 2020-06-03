import 'package:flutter/material.dart';
import 'package:teachmate/src/pages/agenda.dart';
import 'package:teachmate/src/pages/busqueda.dart';
import 'package:teachmate/src/pages/cuenta.dart';
import 'package:teachmate/src/pages/inicio.dart';
import 'package:teachmate/src/pages/mensajes.dart';

int currentIndex = 0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Color bakground;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: _callPage(currentIndex),
      appBar: _crearAppBar(),
      bottomNavigationBar: _crearBottomNavigationBar(),

    );
  }

  Widget _crearAppBar() {
    Widget titulo;
    switch(currentIndex) {
       case 0: titulo = Padding(
         padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
         child: Text('Inicio', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0)),
       );
       break;

       case 1: titulo = Text('Asesorias Pendientes', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black));
       break;

       case 2: titulo = Text('Chats', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0));
       break;

       case 3: titulo = Text('Perfil', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0));
       break;

    }
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppBar(
              elevation: 1.0,
              backgroundColor: Colors.white,
              title: titulo,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.search, color: Colors.black54, size: 30.0),
                    onPressed: (){ Navigator.pushNamed(context, 'busqueda');}
                  ),
                )
              ],
            ),
          ],
        ),
      );
  }

  Widget _callPage(int paginaActual) {

    switch(paginaActual) {
      case 0: return InicioPage();
      case 1: return AgendaPage();
      case 2: return MensajesPage();
      case 3: return CuentaPage();

      default: return InicioPage();
    }

  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 35.0,
      currentIndex: currentIndex,
      backgroundColor: Colors.grey[200],
      unselectedItemColor: Colors.black87,
      selectedItemColor: Colors.indigo[400],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items:  [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book, ),
          title: Text('')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          title: Text('')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('')
        ),
      ],
    );
  }
}