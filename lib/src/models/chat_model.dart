class ChatInfo {
  String nombre;
  DateTime hora;
  String texto;
  bool leido;
  bool miMensaje;
  ChatInfo({
    this.nombre,
    this.hora,
    this.texto,
    this.leido,
    this.miMensaje
    }
    
  );
}

List chats = [
  ChatInfo(nombre: 'Issac Martinez',  hora: DateTime.parse('2012-02-27 13:27:00'),texto:'Ya quedo', leido: true, miMensaje: false),
  ChatInfo(nombre: 'Ivonne Alvarez',  hora: DateTime.parse('2012-02-27 13:27:00'),texto:'No te veo', leido: false, miMensaje: false),
  ChatInfo(nombre: 'Hector Lopez',    hora: DateTime.parse('2012-02-27 13:27:00'),texto:'Ese dia esta bien ya quedo', leido: true, miMensaje: true),
  ChatInfo(nombre: 'Fatima Marcela',  hora: DateTime.parse('2012-02-27 13:27:00'),texto:'El socialismo no funciona', leido: true, miMensaje: true),
  ChatInfo(nombre: 'Hugo Chavez',     hora: DateTime.parse('2012-02-27 13:27:00'),texto:'De nada, suerte', leido: false, miMensaje: false),
  ChatInfo(nombre: 'Emilio Padilla',  hora: DateTime.parse('2012-02-27 13:27:00'),texto:'Ese dia esta bien', leido: true, miMensaje: false),
  ChatInfo(nombre: 'Beatriz Gordillo',hora: DateTime.parse('2012-02-27 13:27:00'),texto:'Felicidades shinji', leido: true, miMensaje: false)
];


