
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class CategorieProduitResponseModel {
  final int? status;
  final bool? success;
  final String? message;
  final List<CategorieProduit>? categories;

  CategorieProduitResponseModel({this.status, this.success, this.message, this.categories});

  factory CategorieProduitResponseModel.fromJson(String string) => CategorieProduitResponseModel.fromMap(json.decode(string));

  factory CategorieProduitResponseModel.fromMap(Map<String, dynamic> map) => CategorieProduitResponseModel(
    status: map["status"] as int?,
    success: map["success"] as bool?,
    message: map["message"] as String?,
    categories: map["results"] == null ? null : List<CategorieProduit>.from(map["results"].map((x) => CategorieProduit.fromMap(x)))
  );


  Map<String, dynamic> toMap() => {
    "status": status,
    "success": success,
    "message": message,
    "categories": List<Map<String, dynamic>>.from(categories!.map((x) => x.toMap()))
  };

  String toJson() => json.encode(toMap());

}

class CategorieProduit {
   final String? id;
  final String? nom;
  final DateTime? created_at;
  final DateTime? updated_at;

  CategorieProduit(
      {this.id, this.nom, this.created_at, this.updated_at, });


  factory CategorieProduit.fromJson(String string) => CategorieProduit.fromMap(json.decode(string));

  factory CategorieProduit.fromMap(Map<String, dynamic> map) => CategorieProduit(
    id: map['id'] as String?,
    nom: map['nom'] as String?,
    created_at: map['created_at'] == null ? null : DateTime.parse(map['created_at']),
    updated_at: map['updated_at'] == null ? null : DateTime.parse(map['updated_at']),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nom": nom,
    "created_at": created_at!.toIso8601String(),
    "updated_at": updated_at!.toIso8601String(),
  };

  String toJson() => json.encode(toMap());
}