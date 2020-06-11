import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teachmate/src/models/materia_model.dart';
import 'package:teachmate/src/pages/editar.dart';
import 'package:teachmate/src/widgets/materia_sticker.dart';


class CuentaPage extends StatefulWidget {
  CuentaPage({this.usuarioInfo});
  Map<String, dynamic> usuarioInfo;

  @override
  _CuentaPageState createState() => _CuentaPageState();
}

class _CuentaPageState extends State<CuentaPage> {  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _crearAppBar(),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 125,
                    color: Colors.grey[200]
                  ),
                  Container(
                    height: 90,
                    color: Colors.indigo[300]
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height*0.005),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            child: CircleAvatar(
                              maxRadius: 55.0,
                              backgroundImage: NetworkImage(widget.usuarioInfo['urlPhoto'].toString()),
                            ),
                            elevation: 5.0,
                            shape: CircleBorder(),
                            clipBehavior: Clip.antiAlias,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            Container(
              color: Colors.grey[200],
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        widget.usuarioInfo['nombre'].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                ],
              )
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    FlatButton(
                        child: Text(
                          'Cerrar sesión',
                          style: TextStyle(color: Colors.red),
                          ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'iniciarSesion');
                        }
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Ocupación:",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          widget.usuarioInfo['ocupacion'] != null ? widget.usuarioInfo['ocupacion'] : " ",
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                          )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Text(
                          "Información:",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                    ],),
                    Container(
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.usuarioInfo['info'] != null ? widget.usuarioInfo['info'] : " ",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Areas de conocimiento:",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    StreamBuilder(
                      stream: Firestore.instance.collection('materias').where('idUsuario', isEqualTo: widget.usuarioInfo['id']).snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if(!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator(),);
                        }
                        var materiasSnap = snapshot.data.documents;
                        return Wrap(
                          direction: Axis.horizontal, 
                          children:
                          List.generate(materiasSnap.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5, bottom: 5),
                              child: materiaSticker(materiasSnap[index].data['nombre']),
                            );                          
                          })
                          
                        );
                      }
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          "Agregar materia",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        onPressed: () {
                        
                      },)
                    ],)
                  ],
                )
              )
            ],
          ),
        ),
      ),      
    );
  }

  Widget _crearAppBar() {
    return PreferredSize(
      child: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.indigo[300],
        title: Container(
          child: Text('Perfil', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25.0))
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit), 
            onPressed: () { 
              Navigator.push(context, MaterialPageRoute(builder: (_) => EditarPage(usuarioInfo: widget.usuarioInfo,)));
            },
          )
        ],
      ),
      preferredSize: Size.fromHeight(60.0)
    );
  }
}