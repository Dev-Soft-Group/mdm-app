import 'dart:convert';

import 'package:mdmscoops/models/response_model/produit_model.dart';
import 'package:mdmscoops/models/response_model/produit_paginate_model.dart';

class CategorieResponseModel {
  final int? status;
  final bool? success;
  final String? message;
  final List<Categorie>? categories;

  CategorieResponseModel({this.status, this.success, this.message, this.categories});

  factory CategorieResponseModel.fromJson(String string) => CategorieResponseModel.fromMap(json.decode(string));

  factory CategorieResponseModel.fromMap(Map<String, dynamic> map) => CategorieResponseModel(
    status: map["status"] as int?,
    success: map["success"] as bool?,
    message: map["message"] as String?,
    categories: map["results"] == null ? null : List<Categorie>.from(map["results"].map((x) => Categorie.fromMap(x)))
  );


  Map<String, dynamic> toMap() => {
    "status": status,
    "success": success,
    "message": message,
    "categories": List<Map<String, dynamic>>.from(categories!.map((x) => x.toMap()))
  };

  String toJson() => json.encode(toMap());

}

class Categorie {
  final String? id;
  final String? nom;
  final DateTime? created_at;
  final DateTime? updated_at;
  final ProduitPaginateResponseModel? produitModel;

  Categorie(
      {this.id, this.nom, this.created_at, this.updated_at, this.produitModel});


  factory Categorie.fromJson(String string) => Categorie.fromMap(json.decode(string));

  factory Categorie.fromMap(Map<String, dynamic> map) => Categorie(
    id: map['id'] as String?,
    nom: map['nom'] as String?,
    created_at: map['created_at'] == null ? null : DateTime.parse(map['created_at']),
    updated_at: map['updated_at'] == null ? null : DateTime.parse(map['updated_at']),
    produitModel: ProduitPaginateResponseModel.fromMap(map["produits"])
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nom": nom,
    "created_at": created_at!.toIso8601String(),
    "updated_at": updated_at!.toIso8601String(),
    "produitModel": produitModel!.toMap()
  };

  String toJson() => json.encode(toMap());
}
