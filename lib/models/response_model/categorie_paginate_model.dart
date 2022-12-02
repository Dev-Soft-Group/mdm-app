import 'dart:convert';

import 'package:mdmscoops/models/response_model/categorie_model.dart';
import 'package:mdmscoops/models/response_model/produit_model.dart';

class CategoriePaginateResponseModel {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Categorie>? categories;

  CategoriePaginateResponseModel(
      {this.count, this.next, this.previous, this.categories});

  factory CategoriePaginateResponseModel.fromJson(String string) =>
      CategoriePaginateResponseModel.fromMap(json.decode(string));

  factory CategoriePaginateResponseModel.fromMap(Map<String, dynamic> map) =>
      CategoriePaginateResponseModel(
          count: map["count"] as int?,
          next: map["next"],
          previous: map["previous"],
          categories: map["results"] == null
              ? null
              : List<Categorie>.from(
                  map["results"].map((x) => Categorie.fromMap(x)))
          );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "categories": List<Map<String, dynamic>>.from(categories!.map((x) => x.toMap()))
      };

  String toJson() => json.encode(toMap());
}


