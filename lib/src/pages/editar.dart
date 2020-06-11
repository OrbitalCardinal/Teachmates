import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teachmate/src/pages/cuenta.dart';

class EditarPage extends StatefulWidget {
  EditarPage({this.usuarioInfo});
  Map<String, dynamic> usuarioInfo;
  @override
  _EditarPageState createState() => _EditarPageState();
}

class _EditarPageState extends State<EditarPage> {
  TextEditingController controllerOcupacion = TextEditingController();
  TextEditingController controllerInfo = TextEditingController();
  var _formKey = GlobalKey<FormState>();
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
                          Container(
                            child: Stack(
                              alignment: Alignment.center,
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
                                Center(
                                  child: IconButton(
                                    icon: Icon(Icons.camera_alt),
                                    iconSize: 40.0,
                                    color: Colors.white,
                                    onPressed: ()  {
                                      ImagePicker().getImage(source: ImageSource.gallery).then((foto) async {
                                          var imagen = foto;
                                          StorageReference storageReference = FirebaseStorage.instance 
                                          .ref()
                                          .child('photos/' + widget.usuarioInfo['id'] + "_profile.png");
                                          StorageUploadTask uploadTask = storageReference.putFile(File(imagen.path));
                                          StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete.then((value) {
                                            value.ref.getDownloadURL().then((link) {
                                              Firestore.instance.collection('usuario').where('id', isEqualTo: widget.usuarioInfo['id']).getDocuments().then((document) {
                                                Firestore.instance.collection('usuario').document(document.documents[0].documentID).updateData({
                                                  'urlPhoto':link
                                                }).then((onUpload) {
                                                  setState(() {
                                                    widget.usuarioInfo['urlPhoto'] = link;
                                                  });
                                                });  
                                              });
                                            });
                                          });
                                      });
                                    },
                                  ),
                                )
                              ],
                              
                            ),
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
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Ocupación:",
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                        ],
                      ),
                      Row(children: <Widget>[
                        Expanded(
                            child: TextFormField(
                              initialValue: widget.usuarioInfo['ocupacion'],
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: "Ingrese su ocupación",
                                hintStyle: TextStyle(
                                  color: Colors.grey[800],
                                  fontStyle: FontStyle.italic,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(color: Colors.indigo[300])
                                ),
                              ), 
                              onSaved: (newValue) {
                                controllerOcupacion.text = newValue;
                              },
                            ),
                          ),
                      ],),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Text(
                            "Información:",
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          )
                      ],),
                      Row(children: <Widget>[
                        Expanded(
                            child: TextFormField(
                              initialValue: widget.usuarioInfo['info'], 
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: "Actualize su información",
                                hintStyle: TextStyle(
                                  color: Colors.grey[800],
                                  fontStyle: FontStyle.italic,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(color: Colors.indigo[300])
                                ),
                              ), 
                              onSaved: (newValue) {
                                controllerInfo.text = newValue;
                              },
                              
                            ),
                          ),
                      ],),
                    ],
                  ),
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
        leading: IconButton( 
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear),
          ),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.indigo[300],
        title: Container(
          child: Center(child: Text('Editar', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25.0)))
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done, color: Colors.white,), 
            onPressed: () { 
              Firestore.instance.collection('usuario').where('id', isEqualTo: widget.usuarioInfo['id']).getDocuments().then((document) {
                _formKey.currentState.save();
                Firestore.instance.collection('usuario').document(document.documents[0].documentID).updateData({
                  'ocupacion': controllerOcupacion.text,
                  'info': controllerInfo.text
                }).then((onUpload) {
                  Navigator.pop(context);
                });  
              });
            },
          )
        ],
      ),
      preferredSize: Size.fromHeight(60.0)
    );
  }
}