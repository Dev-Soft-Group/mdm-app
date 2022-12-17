// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class SuccursaleResponseModel {
  final int? status;
  final bool? success;
  final String? message;
  final List<Succursale>? succursales;

  SuccursaleResponseModel(
      {this.status, this.success, this.message, this.succursales});

  factory SuccursaleResponseModel.fromJson(String string) =>
      SuccursaleResponseModel.fromMap(json.decode(string));

  factory SuccursaleResponseModel.fromMap(Map<String, dynamic> map) =>
      SuccursaleResponseModel(
          status: map["status"] as int?,
          success: map["success"] as bool?,
          message: map["message"] as String?,
          succursales: map["results"] == null
              ? null
              : List<Succursale>.from(
                  map["results"].map((x) => Succursale.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "message": message,
        "succursales": succursales
      };

  String toJson() => json.encode(toMap());
}

class Succursale {
  final String? id;
  final String? nom;
  final String? localisation;
  final String? telephone;
  final String? email;
  final String? entreprise;
  final DateTime? created_at;
  final DateTime? updated_at;

  Succursale(
      {this.id,
      this.nom,
      this.localisation,
      this.telephone,
      this.email,
      this.entreprise,
      this.created_at,
      this.updated_at});

  factory Succursale.fromJson(String string) =>
      Succursale.fromMap(json.decode(string));

  factory Succursale.fromMap(Map<String, dynamic> map) => Succursale(
      id: map['id'] as String?,
      nom: map['nom'] as String?,
      localisation: map["localisation"] as String?,
      telephone: map["telephone"] as String?,
      email: map["email"] as String?,
      entreprise: map["entreprise"] as String?,
      created_at:
          map["created_at"] == null ? null : DateTime.parse(map["created_at"]),
      updated_at:
          map["updated_at"] == null ? null : DateTime.parse(map["updated_at"]));

  Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "localisation": localisation,
        "telephone": telephone,
        "email": email,
        "entreprise": entreprise,
        "created_at": created_at!.toIso8601String(),
        "updated_at": updated_at!.toIso8601String()
      };

  String toJson() => json.encode(toMap());
}
