import 'dart:convert';

import 'package:mdmscoops/models/response_model/corps_metier_model.dart';
import 'package:mdmscoops/models/response_model/succursale_model.dart';

class EntrepriseResponseModel {
  final int? status;
  final bool? success;
  final String? message;
  final List<Entreprise>? entreprises;

  EntrepriseResponseModel(
      {this.status, this.success, this.message, this.entreprises});

  factory EntrepriseResponseModel.fromJson(String string) =>
      EntrepriseResponseModel.fromMap(json.decode(string));

  factory EntrepriseResponseModel.fromMap(Map<String, dynamic> map) =>
      EntrepriseResponseModel(
          status: map["status"] as int?,
          success: map["success"] as bool?,
          message: map["message"] as String?,
          entreprises: map["results"] == null
              ? null
              : List<Entreprise>.from(
                  map["results"].map((x) => Entreprise.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "message": message,
        "entreprises": entreprises
      };

  String toJson() => json.encode(toMap());
}

class Entreprise {
  final String? id;
  final String? nom;
  final String? siegeSocial;
  final String? telephone;
  final String? email;
  final String? logoUrl;
  final String? sites;
  final int? utilisateur;
  final List<Succursale>? succursales;
  final List<CorpsMetier>? entrepriseCorps;
  final DateTime? created_at;
  final DateTime? updated_at;

  Entreprise({
      this.id,
      this.nom,
      this.siegeSocial,
      this.telephone,
      this.email,
      this.logoUrl,
      this.sites,
      this.utilisateur,
      this.succursales,
      this.entrepriseCorps,
      this.created_at,
      this.updated_at});

  factory Entreprise.fromJson(String string) =>
      Entreprise.fromMap(json.decode(string));

  factory Entreprise.fromMap(Map<String, dynamic> map) => Entreprise(
      id: map['id'] as String?,
      nom: map['nom'] as String?,
      siegeSocial: map["localisation"] as String?,
      telephone: map["telephone"] as String?,
      email: map["email"] as String?,
      logoUrl: map["logoUrl"] as String?,
      sites: map["sites"] as String?,
      succursales: map["succursales"] == null ? [] : List<Succursale>.from(map['succursales'].map((x) => Succursale.fromMap(x))),
      entrepriseCorps: map["entrepriseCorps"] == null ? [] : List<CorpsMetier>.from(map['entrepriseCorps'].map((x) => CorpsMetier.fromMap(x))),
      created_at:
          map["created_at"] == null ? null : DateTime.parse(map["created_at"]),
      updated_at:
          map["updated_at"] == null ? null : DateTime.parse(map["updated_at"]));

  Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "siegeSocial": siegeSocial,
        "telephone": telephone,
        "email": email,
        "logoUrl": logoUrl,
        "sites": sites,
        "succursales": succursales,
        "entrepriseCorps": entrepriseCorps,
        "utilisateur": utilisateur,
        "created_at": created_at!.toIso8601String(),
        "updated_at": updated_at!.toIso8601String()
      };

  String toJson() => json.encode(toMap());
}
