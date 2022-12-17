// ignore_for_file: non_constant_identifier_names

import 'dart:convert';



class PublicationResponseModel {
  final int? status;
  final bool? success;
  final String? message;
  final List<Publication>? publications;

  PublicationResponseModel(
      {this.status, this.success, this.message, this.publications});

  factory PublicationResponseModel.fromJson(String string) =>
      PublicationResponseModel.fromMap(json.decode(string));

  factory PublicationResponseModel.fromMap(Map<String, dynamic> map) =>
      PublicationResponseModel(
          status: map["status"] as int?,
          success: map["success"] as bool?,
          message: map["message"] as String?,
          publications: map["results"] == null
              ? null
              : List<Publication>.from(
                  map["results"].map((x) => Publication.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "message": message,
        "publications": List<Map<String, dynamic>>.from(publications!.map((x) => x.toMap()))
      };

  String toJson() => json.encode(toMap());
}

class Publication {
  final String? id;
  final String? titre;
  final String? description;
  final String? imageUrl;
  final int? auteur;
  final String? entreprise;
  final int? type;
  final DateTime? created_at;
  final DateTime? updated_at;

  Publication(
      {this.id,
      this.titre,
      this.description,
      this.imageUrl,
      this.auteur,
      this.entreprise,
      this.type,
      this.created_at,
      this.updated_at});

  factory Publication.fromJson(String string) =>
      Publication.fromMap(json.decode(string));

  factory Publication.fromMap(Map<String, dynamic> map) => Publication(
      id: map['id'] as String?,
      titre: map['titre'] as String?,
      description: map["description"] as String?,
      imageUrl: map["imageUrl"] as String?,
      auteur: map["auteur"] as int?,
      entreprise: map["entreprise"] as String?,
      type: map["type"] as int?,
      created_at:
          map["created_at"] == null ? null : DateTime.parse(map["created_at"]),
      updated_at:
          map["updated_at"] == null ? null : DateTime.parse(map["updated_at"]));

  Map<String, dynamic> toMap() => {
        "id": id,
        "titre": titre,
        "description": description,
        "imageUrl": imageUrl,
        "auteur": auteur,
        "entreprise": entreprise,
        "type": type,
        "created_at": created_at!.toIso8601String(),
        "updated_at": updated_at!.toIso8601String()
      };

  String toJson() => json.encode(toMap());
}
