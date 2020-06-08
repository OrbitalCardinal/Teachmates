import 'package:flutter/material.dart';
import 'package:teachmate/src/models/coloresMaterias.dart';

Widget materiaSticker(String materia) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: coloresMaterias[materia],
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.5),
      child: Text(materia.toString(), style: TextStyle(color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w500),),
    )
  );
}
