class SalaChatModel {
  String id;
  bool asesoria;
  String miId;
  String idUsuario;
  
  SalaChatModel({
    this.id,
    this.asesoria,
    this.miId,
    this.idUsuario
  });
  
}

List<SalaChatModel> salas = [
  SalaChatModel(id: "1", asesoria: true, miId: "1", idUsuario: "2"),
  SalaChatModel(id: "2", asesoria: false, miId: "1", idUsuario: "3"),
  SalaChatModel(id: "3", asesoria: false, miId: "1", idUsuario: "4"),
  SalaChatModel(id: "4", asesoria: false, miId: "1", idUsuario: "5"),
  SalaChatModel(id: "5", asesoria: false, miId: "1", idUsuario: "6"),
  SalaChatModel(id: "6", asesoria: false, miId: "1", idUsuario: "7"),
  SalaChatModel(id: "7", asesoria: false, miId: "1", idUsuario: "8"),
];