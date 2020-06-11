import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teachmate/src/models/asesoria_model.dart';

var dias = {
  1: "Lunes",
  2: "Martes",
  3: "Miercoles",
  4: "Jueves",
  5: "Viernes",
  6: "Sabado",
  7: "Domingo"
};

List<String> meses = [
  "Enero",
  "Febrero",
  "Marzo",
  "Abril",
  "Mayo",
  "Junio",
  "Julio",
  "Agosto",
  "Septiembre",
  "Octumbre",
  "Noviembre",
  "Diciembre"
];


Widget crearTarjetaHorizontal(AsesoriaModel asesoria) {
    return StreamBuilder(
      stream: Firestore.instance.collection('usuario').where('id', isEqualTo: asesoria.idUsuario).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }
        
        DocumentSnapshot infoUsuario = snapshot.data.documents[0];
        
        return GestureDetector(
            onTap: () {
              
            },
            child: Container(
              margin: EdgeInsets.all(7.0),
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
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: FittedBox(
                      child: Image.network(infoUsuario.data['urlPhoto'], height: 120.0, width: 120.0, fit: BoxFit.cover,),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(infoUsuario.data['nombre'], style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w500 ),),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue[600],
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: Text('Informática', style: TextStyle(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.w500),),
                      )
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      dias[asesoria.fecha.toDate().weekday] + " " + asesoria.fecha.toDate().day.toString() + " de " + meses[asesoria.fecha.toDate().month], 
                      style: TextStyle(color: Colors.grey, fontSize: 15.0 )),
                    Row(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          asesoria.fecha.toDate().hour.toString() + ":" + asesoria.fecha.toDate().minute.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold )),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }