class AsesoriaModel {
  String id;
  DateTime fecha;
  String idAsesor;
  String idAsesorado;
  String materia;
  
  AsesoriaModel({
    this.id,
    this.fecha,
    this.idAsesor,
    this.idAsesorado,
    this.materia
  });
}

List<AsesoriaModel> asesorias = [
  AsesoriaModel(id: "1", fecha: DateTime.now(), idAsesor: "2", idAsesorado: "1", materia: "Matematicas"),
  AsesoriaModel(id: "2", fecha: DateTime.now(), idAsesor: "3", idAsesorado: "1", materia: "Ciencias fisicas"),
  AsesoriaModel(id: "3", fecha: DateTime.now(), idAsesor: "4", idAsesorado: "1", materia: "Medicina"),
  AsesoriaModel(id: "4", fecha: DateTime.now(), idAsesor: "5", idAsesorado: "1", materia: "Ingenieria")
];