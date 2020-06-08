import 'package:flutter/material.dart';

class AgendarPage extends StatefulWidget {
  final String asesor;
  AgendarPage({this.asesor});
  @override
  _AgendarPageState createState() => _AgendarPageState();
}

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

class _AgendarPageState extends State<AgendarPage> {
  TimeOfDay _hora = TimeOfDay.now();
  DateTime _fecha = DateTime.now();
  
  Future<Null> _seleccionarFecha(BuildContext context) async {
    final DateTime seleccionada = await showDatePicker(
      context: context,
      initialDate: _fecha, 
      firstDate: DateTime(2019), 
      lastDate: DateTime(2021)
    );
    
    if(seleccionada != null && seleccionada != _fecha) {
        setState(() {
          _fecha = seleccionada;
        });
    } 
  }
  
  
  Future<Null> _seleccionarHora(BuildContext context) async {
    final TimeOfDay seleccionada = await showTimePicker(
      context: context, 
      initialTime: _hora
    );
    
    if(seleccionada != null && seleccionada != _hora) {
      setState(() {
        _hora = seleccionada;
      });
    }        
}
  

  @override
  Widget build(BuildContext context) {
    String hora = _hora.hour.toString() + ":" + _hora.minute.toString() + " " + _hora.period.toString().split("DayPeriod.")[1].toString();
    String fecha =_fecha.day.toString() + " de " + meses[_fecha.month - 1] + " " + _fecha.year.toString();
    
    return Scaffold(
      appBar: _crearAppBar(),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              color: Colors.indigo[300],
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Container(
                    child: Column(children: <Widget>[
                      CircleAvatar(radius: 70.0),
                      SizedBox(height: 10.0,),
                      Text(widget.asesor, style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold ,color: Colors.white),)  ,
                    ],),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    children: <Widget>[
                    RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.green,
                        child: Text("Escoger día", style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          _seleccionarFecha(context);
                        } ,
                      ),
                      SizedBox(width: 20.0),
                  RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.green,
                        child: Text("Escoger hora", style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          _seleccionarHora(context);
                        } ,
                  )
                  ],)
                  
                ],)
              ],)
            ),
            _informacion(fecha, hora),
          ],
        ),
      )
    );
  }
}

Widget _crearAppBar() {
    return PreferredSize(
      child: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white,
        ),
        elevation: 1.0,
        backgroundColor: Colors.indigo[300],
        title: Container(
          child: Text('Agendar', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25.0))
        ),
      ),
      preferredSize: Size.fromHeight(60.0)
    );
}

Widget _informacion(fecha, hora) {
  return Container(
              margin: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                        "Información de la asesoria",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(children: <Widget>[
                  Text(
                        "Día:",
                        style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                  ),
                  SizedBox(width: 7.0),
                  Text(
                    fecha,
                    style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold ,color: Colors.green),
                  )
                  
                ],),
                SizedBox(height:10.0),
                Row(children: <Widget>[
                  Text(
                        "Hora:",
                        style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                  ),
                  SizedBox(width: 7.0),
                  Text(
                    hora,
                    style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold ,color: Colors.green),
                  )
                ],),
                SizedBox(height:10.0),
                Row(children: <Widget>[
                  Text(
                        "Materia:",
                        style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                  ),
                  SizedBox(width: 7.0),
                  Text(
                    "Matematicas",
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.green)
                  )
                ],),
                SizedBox(height:10.0),
                Row(children: <Widget>[
                  Text(
                        "Nota:",
                        style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                  ),
                ],),
                SizedBox(height:10.0),
                Row(children: <Widget>[
                  Expanded(
                    child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Escribe una nota para el asesor...",
                      hintStyle: TextStyle(
                        color: Colors.grey[800],
                        fontStyle: FontStyle.italic,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.indigo[300])
                      ),
                    ), 
                    
                  ),
                ),
                ],),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.book,
                              color: Colors.white,
                              size: 15.0,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Agendar",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        )
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.green,
                      onPressed: () {
                    },),
                  ],
                ),
              ],)          
            );
}
