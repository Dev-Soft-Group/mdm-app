import 'dart:convert';

class CommentaireResponseModel {
  final int? status;
  final bool? success;
  final String? message;
  final List<Commentaire>? commentaires;

  CommentaireResponseModel(
      {this.status, this.success, this.message, this.commentaires});

  factory CommentaireResponseModel.fromJson(String string) =>
      CommentaireResponseModel.fromMap(json.decode(string));

  factory CommentaireResponseModel.fromMap(Map<String, dynamic> map) =>
      CommentaireResponseModel(
          status: map["status"] as int?,
          success: map["success"] as bool?,
          message: map["message"] as String?,
          commentaires: map["results"] == null
              ? null
              : List<Commentaire>.from(
                  map["results"].map((x) => Commentaire.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "message": message,
        "produits":
            List<Map<String, dynamic>>.from(commentaires!.map((x) => x.toMap()))
      };

  String toJson() => json.encode(toMap());
}

class Commentaire {
  final String? id;
  final String? produit;
  final String? publication;
  final int? proprietaire;
  final String? contenu;
  final String? username;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Commentaire(
      {this.id,
      this.produit,
      this.publication,
      this.proprietaire,
      this.contenu,
      this.username,
      this.createdAt,
      this.updatedAt});


  factory Commentaire.fromJson(String string) => Commentaire.fromMap(json.decode(string));

  factory Commentaire.fromMap(Map<String, dynamic> map) => Commentaire(
    id:  map["id"] as String?,
    produit:  map["produit"] as String?,
    publication:  map["publication"] as String?,
    proprietaire:  map["proprietaire"] as int?,
    contenu:  map["contenu"] as String?,
    username:  map["username"] as String?,
    createdAt: map["created_at"] == null ? null : DateTime.parse(map["created_at"]),
    updatedAt: map["updated_at"] == null ? null : DateTime.parse(map["updated_at"])
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "produit": produit,
    "publication": publication,
    "proprietaire": proprietaire,
    "contenu": contenu,
    "username": username,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };

  String toJson() => json.encode(toMap());
}
