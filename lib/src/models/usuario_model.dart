import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
    UsuarioModel({
        this.id,
        this.asesor,
        this.correo,
        // this.materias,
        this.nombre,
        this.urlPhoto,
    });

    String id;
    bool asesor;
    String correo;
    // Materias materias;
    String nombre;
    String urlPhoto;

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        asesor: json["asesor"],
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

class Materias {
    Materias({
        this.principal,
        this.secundarias,
    });

    String principal;
    List<String> secundarias;

    // factory Materias.fromJson(Map<String, dynamic> json) => Materias(
    //     principal: json["principal"],
    //     secundarias: List<String>.from(json["secundarias"].map((x) => x)),
    // );

    // Map<String, dynamic> toJson() => {
    //     "principal": principal,
    //     "secundarias": List<dynamic>.from(secundarias.map((x) => x)),
    // };
}