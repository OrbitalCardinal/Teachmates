import 'package:cloud_firestore/cloud_firestore.dart';

class MensajeModel {
  String mensajeId;
  String texto;
  String idSalaChat;
  String idUsuario;
  Timestamp fecha;
  bool leido;
  
  MensajeModel({
    this.mensajeId,
    this.idSalaChat,
    this.texto,
    this.fecha,
    this.idUsuario,
    this.leido
  });
}

List<MensajeModel> mensajes = [
    MensajeModel(mensajeId: "1",idSalaChat: "1", texto: "Hola como estas?", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "2",idSalaChat: "1", texto: "Bien y tu?", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "3",idSalaChat: "1", texto: "Que haces?", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "4",idSalaChat: "1", texto: "Estoy bien, escucho musica y tu?", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "5",idSalaChat: "1", texto: "Que musica escuchas?", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "6",idSalaChat: "1", texto: "Rock", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "7",idSalaChat: "1", texto: "x5 xD", fecha: Timestamp.now(), idUsuario: "2", leido: false),

    MensajeModel(mensajeId: "8",idSalaChat: "2", texto: "Hola hola", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "9",idSalaChat: "2", texto: "Que haces", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "10",idSalaChat: "2", texto: "SSSSSS", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "11",idSalaChat: "2", texto: "jalo yo mas", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "12",idSalaChat: "2", texto: "Hola adios", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "13",idSalaChat: "2", texto: "Calla", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "14",idSalaChat: "2", texto: "JAJAJAJJAJAJ", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    
    MensajeModel(mensajeId: "15",idSalaChat: "3", texto: "Hola hola", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "16",idSalaChat: "3", texto: "Que haces", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "17",idSalaChat: "3", texto: "SSSSSS", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "18",idSalaChat: "3", texto: "jalo yo mas", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "19",idSalaChat: "3", texto: "Hola adios", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "20",idSalaChat: "3", texto: "Calla", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "21",idSalaChat: "3", texto: "Hola Bola", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    
    MensajeModel(mensajeId: "22",idSalaChat: "4", texto: "Hola hola", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "23",idSalaChat: "4", texto: "Que haces", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "24",idSalaChat: "4", texto: "SSSSSS", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "25",idSalaChat: "4", texto: "jalo yo mas", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "26",idSalaChat: "4", texto: "Hola adios", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "27",idSalaChat: "4", texto: "Calla", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "28",idSalaChat: "4", texto: "Ultimo mensaje", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    
    MensajeModel(mensajeId: "29",idSalaChat: "5", texto: "Hola hola", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "30",idSalaChat: "5", texto: "Que haces", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "31",idSalaChat: "5", texto: "SSSSSS", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "32",idSalaChat: "5", texto: "jalo yo mas", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "33",idSalaChat: "5", texto: "Hola adios", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "34",idSalaChat: "5", texto: "Calla", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "35",idSalaChat: "5", texto: "De que stas hablando?", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    
    MensajeModel(mensajeId: "36",idSalaChat: "6", texto: "Hola hola", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "37",idSalaChat: "6", texto: "Que haces", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "38",idSalaChat: "6", texto: "SSSSSS", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "39",idSalaChat: "6", texto: "jalo yo mas", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "40",idSalaChat: "6", texto: "Hola adios", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "41",idSalaChat: "6", texto: "Calla", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "42",idSalaChat: "6", texto: "Linea nueve", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    
    MensajeModel(mensajeId: "43",idSalaChat: "7", texto: "Hola hola", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "44",idSalaChat: "7", texto: "Que haces", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "45",idSalaChat: "7", texto: "SSSSSS", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "46",idSalaChat: "7", texto: "jalo yo mas", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "47",idSalaChat: "7", texto: "Hola adios", fecha: Timestamp.now(), idUsuario: "2", leido: false),
    MensajeModel(mensajeId: "48",idSalaChat: "7", texto: "Calla", fecha: Timestamp.now(), idUsuario: "1", leido: false),
    MensajeModel(mensajeId: "49",idSalaChat: "7", texto: "De ques?", fecha: Timestamp.now(), idUsuario: "2", leido: true),
  ];
