import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teachmate/src/pages/agenda.dart';
import 'package:teachmate/src/pages/cuenta.dart';
import 'package:teachmate/src/pages/inicio.dart';
import 'package:teachmate/src/pages/mensajes.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
   ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);


    return BottomNavigationBar(
      iconSize: 35.0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.indigo[400],
      unselectedItemColor: Color(0xff242424),
      backgroundColor: Color(0xffF6F6F6),
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem( icon: Icon( Icons.home ), title: Text('') ),
        BottomNavigationBarItem( icon: Icon( Icons.book ), title: Text('') ),
        BottomNavigationBarItem( icon: Icon( Icons.chat_bubble ), title: Text('') ),
        BottomNavigationBarItem( icon: Icon( Icons.account_circle ), title: Text('') ),
      ]
    );
  }
}

class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[

        InicioPage(),
        AgendaPage(),
        MensajesPage(),
        CuentaPage(),

      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier{

  int _paginaActual = 0;
  PageController _pageController = new PageController();


  int get paginaActual => this._paginaActual;
  
  set paginaActual( int valor ) {
    this._paginaActual = valor;

    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut );

    notifyListeners();
  }

  PageController get pageController => this._pageController;

}