import 'package:flutter/material.dart';
import 'package:teachmate/src/models/materia_model.dart';
import 'package:teachmate/src/widgets/materia_sticker.dart';


class CuentaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String miId = "1";
    List<String> materias = [];
    for(var i in listaMaterias) {
      if(i.idUsuario == miId) {
        materias.add(i.nombreMateria);
      }
    }
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
                              child: 
                                Image.network("https://scontent-mia3-2.xx.fbcdn.net/v/t1.0-9/55536510_2270410696612912_6627672482381824000_o.jpg?_nc_cat=102&_nc_sid=174925&_nc_oc=AQm-daHL314zIv5h4RgY7fzERxtyq069fCkNJCvHrrepy8w94OhMGzivp2w0yvSsoXM&_nc_ht=scontent-mia3-2.xx&oh=7768855d3938fa5a42d31af4bff0ab37&oe=5F03711B", height: size.width*0.331, width: size.width*0.331,)
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
                        "Gerardo Coronado",
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
                          Navigator.pushReplacementNamed(context, 'login');
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
                          "Estudiante",
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
                      height: 70.0,
                      child: Text(
                        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
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
                    Wrap(
                      direction: Axis.horizontal, 
                      children:
                      List.generate(materias.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5, bottom: 5),
                          child: materiaSticker(materias[index]),
                        );                          
                      })
                      
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
        elevation: 1.0,
        backgroundColor: Colors.indigo[300],
        title: Container(
          child: Text('Perfil', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25.0))
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit), 
            onPressed: () { 
              
            },
          )
        ],
      ),
      preferredSize: Size.fromHeight(60.0)
    );
  }
}