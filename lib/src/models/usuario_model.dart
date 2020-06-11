import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
    String id;
    bool asesor;
    String correo;
    // Materias materias;
    String nombre;
    String urlPhoto;
    String ocupacion;
    double puntuacionAsesor;
    double puntuacionAsesorado;
    String info;
    UsuarioModel({
        this.id,
        this.correo,
        // this.materias,
        this.nombre,
        this.urlPhoto,
        this.ocupacion,
        this.puntuacionAsesor = 0,
        this.puntuacionAsesorado = 0,
        this.info
    });

    

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        correo: json["correo"],
        //materias: Materias.fromJson(json["materias"]),
        nombre: json["nombre"],
        urlPhoto: json["urlPhoto"],
    );

    Map<String, dynamic> toJson() => {
        "asesor": asesor,
        "correo": correo,
        // "materias": materias.toJson(),
        "nombre": nombre,
        "urlPhoto": urlPhoto,
    };
}

List<UsuarioModel> usuarios = [
  UsuarioModel(id: "2", correo: "asiufndfmu", nombre: "Isaac Martinez",  urlPhoto: "oalmisu", ocupacion: "Estudiante"),
  UsuarioModel(id: "3", correo: "asiufndfmu", nombre: "Ivonne Alvarez",  urlPhoto: "oalmisu", ocupacion: "Maestro"),
  UsuarioModel(id: "4", correo: "asiufndfmu", nombre: "Hector Lopez",    urlPhoto: "oalmisu", ocupacion: "Doctor"),
  UsuarioModel(id: "5", correo: "asiufndfmu", nombre: "Fatima Marcela",  urlPhoto: "oalmisu", ocupacion: "Estudiante"),
  UsuarioModel(id: "6", correo: "asiufndfmu", nombre: "Hugo Chavez",     urlPhoto: "oalmisu", ocupacion: "Estudiante"),
  UsuarioModel(id: "7", correo: "asiufndfmu", nombre: "Emilio Padilla",  urlPhoto: "oalmisu", ocupacion: "Estudiante"),
  UsuarioModel(id: "8", correo: "asiufndfmu", nombre: "Beatriz Gordillo",urlPhoto: "oalmisu", ocupacion: "Estudiante"),  
];
