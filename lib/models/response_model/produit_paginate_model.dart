import 'dart:convert';

import 'package:mdmscoops/models/response_model/produit_model.dart';

class ProduitPaginateResponseModel {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Produit>? produits;

  ProduitPaginateResponseModel(
      {this.count, this.next, this.previous, this.produits});

  factory ProduitPaginateResponseModel.fromJson(String string) =>
      ProduitPaginateResponseModel.fromMap(json.decode(string));

  factory ProduitPaginateResponseModel.fromMap(Map<String, dynamic> map) =>
      ProduitPaginateResponseModel(
          count: map["count"] as int?,
          next: map["next"],
          previous: map["previous"],
          produits: map["results"] == null
              ? null
              : List<Produit>.from(
                  map["results"].map((x) => Produit.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "produits": List<Map<String, dynamic>>.from(produits!.map((x) => x.toMap()))
      };

  String toJson() => json.encode(toMap());
}


