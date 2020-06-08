import 'package:flutter/material.dart';
import 'package:teachmate/src/models/coloresMaterias.dart';
import 'package:teachmate/src/models/materia_model.dart';
import 'package:teachmate/src/models/usuario_model.dart';
import 'package:teachmate/src/widgets/materia_sticker.dart';


Widget crearTarjetaVertical(UsuarioModel usuario) {
    String materia;
    for(var n in listaMaterias) {
      if(usuario.id == n.idUsuario) {
        materia = n.nombreMateria;
      }
    }
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(0.0, 2.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network('https://scontent-mia3-2.xx.fbcdn.net/v/t1.0-9/55536510_2270410696612912_6627672482381824000_o.jpg?_nc_cat=102&_nc_sid=174925&_nc_oc=AQm-daHL314zIv5h4RgY7fzERxtyq069fCkNJCvHrrepy8w94OhMGzivp2w0yvSsoXM&_nc_ht=scontent-mia3-2.xx&oh=7768855d3938fa5a42d31af4bff0ab37&oe=5F03711B', height: 135.0, width: 135.0,),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(usuario.nombre, style: TextStyle(color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.bold ),),
                    Text(usuario.ocupacion, style: TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w300 ))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                materiaSticker(materia),
                Text(usuario.puntuacionAsesor.toString() + '★', style: TextStyle(color: Colors.black, fontSize: 14.0))
              ],
            ),
          )
        ],
      ),
    );
  }
