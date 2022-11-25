import 'dart:convert';

class SeviceResponseModel {
  final int? status;
  final bool? success;
  final String? message;
  final List<Service>? services;

  SeviceResponseModel(
      {this.status, this.success, this.message, this.services});

  factory SeviceResponseModel.fromJson(String string) =>
      SeviceResponseModel.fromMap(json.decode(string));

  factory SeviceResponseModel.fromMap(Map<String, dynamic> map) =>
      SeviceResponseModel(
          status: map["status"] as int?,
          success: map["success"] as bool?,
          message: map["message"] as String?,
          services: map["results"] == null
              ? null
              : List<Service>.from(
                  map["results"].map((x) => Service.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "message": message,
        "services": services
      };

  String toJson() => json.encode(toMap());
}

class Service {
  final String? id;
  final String? nom;
  final String? description;
  final String? imageUrl;
  final String? categorie;
  final int? utilisateur;
  final DateTime? created_at;
  final DateTime? updated_at;

  Service(
      {this.id,
      this.nom,
      this.description,
      this.imageUrl,
      this.categorie,
      this.utilisateur,
      this.created_at,
      this.updated_at});

  factory Service.fromJson(String string) =>
      Service.fromMap(json.decode(string));

  factory Service.fromMap(Map<String, dynamic> map) => Service(
      id: map['id'] as String?,
      nom: map['nom'] as String?,
      description: map["description"] as String?,
      imageUrl: map["imageUrl"] as String?,
      categorie: map["categorie"] as String?,
      utilisateur: map["utilisateur"] as int?,
      created_at:
          map["created_at"] == null ? null : DateTime.parse(map["created_at"]),
      updated_at:
          map["updated_at"] == null ? null : DateTime.parse(map["updated_at"]));

  Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "description": description,
        "imageUrl": imageUrl,
        "categorie": categorie,
        "utilisateur": utilisateur,
        "created_at": created_at!.toIso8601String(),
        "updated_at": updated_at!.toIso8601String()
      };

  String toJson() => json.encode(toMap());
}
