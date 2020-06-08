//Posible tercera tabla MateriaUsuario

class MateriaModel {
  String nombreMateria;
  String idUsuario;
  
  MateriaModel({
    this.nombreMateria,
    this.idUsuario
  });
}

List<MateriaModel> listaMaterias = [
  MateriaModel(nombreMateria: "Artes", idUsuario: "1"),
  MateriaModel(nombreMateria: "Ciencias de la vida", idUsuario: "1"),
  MateriaModel(nombreMateria: "Ciencias de la conducta", idUsuario: "1"),
  MateriaModel(nombreMateria: "Administracion", idUsuario: "1"),
  MateriaModel(nombreMateria: "Comercio", idUsuario: "2"),
  MateriaModel(nombreMateria: "Matematicas", idUsuario: "3"),
  MateriaModel(nombreMateria: "Estadistica", idUsuario: "4"),
  MateriaModel(nombreMateria: "Medicina", idUsuario: "5"),
  MateriaModel(nombreMateria: "Ingenieria", idUsuario: "6"),
  MateriaModel(nombreMateria: "Ciencias fisicas", idUsuario: "7")
];