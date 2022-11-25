import 'dart:convert';

class ProduitResponseModel {}

class Produit {
  final String? id;
  final String? nom;
  final String? description;
  final int? prix;
  final String? imageUrl;
  final String? categorie;
  final int? utilisateur;
  final DateTime? created_at;
  final DateTime? updated_at;

  Produit(
      {this.id,
      this.nom,
      this.description,
      this.prix,
      this.imageUrl,
      this.categorie,
      this.utilisateur,
      this.created_at,
      this.updated_at});


  factory Produit.fromJson(String string) => Produit.fromMap(json.decode(string));

  factory Produit.fromMap(Map<String, dynamic> map) => Produit(
    id: map["id"] as String?,
    nom: map["nom"] as String?,
    description: map["description"] as String?,
    prix: map["prix"] as int?,
    imageUrl: map["imageUrl"] as String?,
    categorie: map["categorie"] as String?,
    utilisateur: map["utilisateur"] as int?,
    created_at: map["created_at"] == null ? null : DateTime.parse(map["created_at"]),
    updated_at: map["updated_at"] == null ? null : DateTime.parse(map["updated_at"])
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nom": nom,
    "description": description,
    "prix": prix,
    "imageUrl": imageUrl,
    "categorie": categorie,
    "utilisateur": utilisateur,
    "created_at": created_at!.toIso8601String(),
    "updated_at": updated_at!.toIso8601String()
  };

  String toJson() => json.encode(toMap());
}
