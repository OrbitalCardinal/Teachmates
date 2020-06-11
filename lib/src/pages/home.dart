import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teachmate/src/pages/agenda.dart';
import 'package:teachmate/src/pages/cuenta.dart';
import 'package:teachmate/src/pages/iniciarSesion.dart';
import 'package:teachmate/src/pages/inicio.dart';
import 'package:teachmate/src/pages/mensajes.dart';
import 'package:teachmate/src/services/auth.dart';

class HomePage extends StatefulWidget {
  HomePage({this.auth});
  final BaseAuth auth;

  @override
  _HomePageState createState() => _HomePageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn
}
class _HomePageState extends State<HomePage> {
  
  AuthStatus authStatus = AuthStatus.notSignedIn;
  String id;
  Map<String, dynamic> usuarioInfo;
  
  initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
       authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn; 
       id = userId;
      });
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    switch(authStatus) {
      case AuthStatus.notSignedIn:
        return new IniciarSesionPage(auth: widget.auth);
      case AuthStatus.signedIn:
        return StreamBuilder(
          stream: Firestore.instance.collection('usuario').reference().where('id', isEqualTo: id).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData) {
              return Center(child: CircularProgressIndicator(),);
            }
            usuarioInfo = snapshot.data.documents[0].data;
            return ChangeNotifierProvider(
              create: (_) => new _NavegacionModel(),
              child: Scaffold(
                body: _Paginas(usuarioInfo: usuarioInfo),
                bottomNavigationBar: _Navegacion(),
              ),
            );
          }
        );
    }
    
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

class _Paginas extends StatefulWidget {
  _Paginas({this.usuarioInfo});
  Map<String, dynamic> usuarioInfo;

  @override
  __PaginasState createState() => __PaginasState();
}

class __PaginasState extends State<_Paginas> {
  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[

        InicioPage(usuarioInfo: widget.usuarioInfo),
        AgendaPage(usuarioInfo: widget.usuarioInfo),
        MensajesPage(usuarioInfo: widget.usuarioInfo),
        CuentaPage(usuarioInfo: widget.usuarioInfo),

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

    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeInOut );

    notifyListeners();
  }

  PageController get pageController => this._pageController;

}