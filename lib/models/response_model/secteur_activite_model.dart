

import 'dart:convert';

class SecteurActiviteResponseModel {
  final int? status;
  final bool? success;
  final String? message;
  final List<SecteurActivite>? secteurActivite;

  SecteurActiviteResponseModel({this.status, this.success, this.message, this.secteurActivite});

  factory SecteurActiviteResponseModel.fromJson(String string) => SecteurActiviteResponseModel.fromMap(json.decode(string));

  factory SecteurActiviteResponseModel.fromMap(Map<String, dynamic> map) => SecteurActiviteResponseModel(
    status: map["status"] as int?,
    success: map["success"] as bool?,
    message: map["message"] as String?,
    secteurActivite: map["results"] == null ? null : List<SecteurActivite>.from(map["results"].map((x) => SecteurActivite.fromMap(x)))
  );


  Map<String, dynamic> toMap() => {
    "status": status,
    "success": success,
    "message": message,
    "secteurActivite": SecteurActivite
  };

  String toJson() => json.encode(toMap());

}

class SecteurActivite {
  final String? id;
  final String? nom;
  final DateTime? created_at;
  final DateTime? updated_at;

  SecteurActivite({this.id, this.nom, this.created_at, this.updated_at});

  factory SecteurActivite.fromJson(String string) => SecteurActivite.fromMap(json.decode(string));

  factory SecteurActivite.fromMap(Map<String, dynamic> map) => SecteurActivite(
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