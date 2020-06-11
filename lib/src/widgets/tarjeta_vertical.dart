import 'package:flutter/material.dart';
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
              child: Image.network(usuario.urlPhoto, height: 120.0, width: 135.0, fit: BoxFit.cover,),
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
