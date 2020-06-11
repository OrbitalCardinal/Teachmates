import 'package:cloud_firestore/cloud_firestore.dart';

class AsesoriaModel {
  String miId;
  Timestamp fecha;
  String idUsuario;
  String materia;
  
  AsesoriaModel({
    this.miId,
    this.fecha,
    this.idUsuario,
    this.materia
  });
}