import 'dart:convert';

import 'package:mdmscoops/models/response_model/produit_model.dart';

class ProduitPaginateResponseModel {
  final int? count;
  dynamic next;
  dynamic previous;
  bool? isSearching;
  List<Produit>? produits;

  ProduitPaginateResponseModel(
      {this.count, this.next, this.previous, this.produits, this.isSearching});

  factory ProduitPaginateResponseModel.fromJson(String string) =>
      ProduitPaginateResponseModel.fromMap(json.decode(string));

  factory ProduitPaginateResponseModel.fromMap(Map<String, dynamic> map) =>
      ProduitPaginateResponseModel(
          count: map["count"] as int?,
          next: map["next"],
          previous: map["previous"],
          isSearching: false,
          produits: map["results"] == null
              ? null
              : List<Produit>.from(
                  map["results"].map((x) => Produit.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "isSearching": isSearching,
        "produits": List<Map<String, dynamic>>.from(produits!.map((x) => x.toMap()))
      };

  String toJson() => json.encode(toMap());
}


