// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:mdmscoops/models/response_model/entreprise_model.dart';

class ProduitResponseModel {
  final int? status;
  final bool? success;
  final String? message;
  final List<Produit>? produits;

  ProduitResponseModel(
      {this.status, this.success, this.message, this.produits});

  factory ProduitResponseModel.fromJson(String string) =>
      ProduitResponseModel.fromMap(json.decode(string));

  factory ProduitResponseModel.fromMap(Map<String, dynamic> map) =>
      ProduitResponseModel(
          status: map["status"] as int?,
          success: map["success"] as bool?,
          message: map["message"] as String?,
          produits: map["results"] == null
              ? null
              : List<Produit>.from(
                  map["results"].map((x) => Produit.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "message": message,
        "produits": List<Map<String, dynamic>>.from(produits!.map((x) => x.toMap()))
      };

  String toJson() => json.encode(toMap());
}

class Produit {
  final String? id;
  final String? nom;
  final String? description;
  final int? prix;
  final String? imageUrl;
  final String? categorie;
  final int? utilisateur;
  final List<Entreprise>? entreprises;
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
      this.entreprises,
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
    entreprises: map["entreprises"] == null ? [] : List<Entreprise>.from(map["entreprises"].map((x) => Entreprise.fromMap(x))),
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
    "entreprises": List<Map<String, dynamic>>.from(entreprises!.map((x) => x.toMap())),
    "created_at": created_at!.toIso8601String(),
    "updated_at": updated_at!.toIso8601String()
  };

  String toJson() => json.encode(toMap());
}
