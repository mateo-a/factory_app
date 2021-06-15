// To parse this JSON data, do
//
//     final factoryModel = factoryModelFromJson(jsonString);

import 'dart:convert';

FactoryModel factoryModelFromJson(String str) =>
    FactoryModel.fromJson(json.decode(str));

String factoryModelToJson(FactoryModel data) => json.encode(data.toJson());

class FactoryModel {
  FactoryModel({
    this.id,
    this.nombre = '',
    this.direccion = '',
    this.telefono = 0,
    this.ciudad = '',
    this.pais = '',
  });

  String id;
  String nombre;
  String direccion;
  int telefono;
  String ciudad;
  String pais;

  factory FactoryModel.fromJson(Map<String, dynamic> json) => FactoryModel(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        ciudad: json["ciudad"],
        pais: json["pais"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "telefono": telefono,
        "ciudad": ciudad,
        "pais": pais,
      };
}
