

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class CoprsMetierResponseModel {
  final int? status;
  final bool? success;
  final String? message;
  final List<CorpsMetier>? corpsMetiers;

  CoprsMetierResponseModel({this.status, this.success, this.message, this.corpsMetiers});

  factory CoprsMetierResponseModel.fromJson(String string) => CoprsMetierResponseModel.fromMap(json.decode(string));

  factory CoprsMetierResponseModel.fromMap(Map<String, dynamic> map) => CoprsMetierResponseModel(
    status: map["status"] as int?,
    success: map["success"] as bool?,
    message: map["message"] as String?,
    corpsMetiers: map["results"] == null ? null : List<CorpsMetier>.from(map["categories"].map((x) => CorpsMetier.fromMap(x)))
  );


  Map<String, dynamic> toMap() => {
    "status": status,
    "success": success,
    "message": message,
    "corpsMetiers": corpsMetiers
  };

  String toJson() => json.encode(toMap());

}

class CorpsMetier {
  final String? id;
  final String? nom;
  final DateTime? created_at;
  final DateTime? updated_at;

  CorpsMetier({this.id, this.nom, this.created_at, this.updated_at});

  factory CorpsMetier.fromJson(String string) => CorpsMetier.fromMap(json.decode(string));

  factory CorpsMetier.fromMap(Map<String, dynamic> map) => CorpsMetier(
     id: map['id'] as String?,
    nom: map['nom'] as String?,
    created_at: map['created_at'] == null ? null : DateTime.parse(map['created_at']),
    updated_at: map['updated_at'] == null ? null : DateTime.parse(map['updated_at']),
  );

   Map<String, dynamic> toMap() => {
    "id": id,
    "nom": nom,
    "created_at": created_at!.toIso8601String(),
    "updated_at": updated_at!.toIso8601String()
  };

  String toJson() => json.encode(toMap());


}