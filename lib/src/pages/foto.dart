import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FotoPage extends StatefulWidget {
  @override
  _FotoPageState createState() => _FotoPageState();
}

class _FotoPageState extends State<FotoPage> {
  PickedFile foto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          RaisedButton(
            onPressed: () async{
              var imagen = await ImagePicker().getImage(source: ImageSource.gallery);
              setState(() {
                foto = imagen;
              });
          }),
          foto != null ? Image.file(File(foto.path)) : CircleAvatar(),
        ],),
      )
    );
  }
}