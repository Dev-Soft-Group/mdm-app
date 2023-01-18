import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdmscoops/components/app_snackbar.dart';
import 'package:mdmscoops/core/app_status.dart';
import 'package:mdmscoops/models/response_model/commentaire_model.dart';
import 'package:mdmscoops/services/remote_services/commentaires/commentaire.dart';



class CommentaireProduitController extends GetxController{
  final CommentairesService _commentaireService = CommentairesServiceImpl();

  AppStatus commentairesStatus = AppStatus.appDefault;
  AppStatus sendStatus = AppStatus.appDefault;

  List<Commentaire>? commentaires = [];
  TextEditingController textEditingCommentaire = TextEditingController();

  String? idProduit;

  @override
  void onInit() async {
    try {
      idProduit = Get.arguments['idProduit'];
      await getAllCommentForProduit();
    } catch (e) {}
    super.onInit();
  }

  Future getAllCommentForProduit() async {
    commentairesStatus = AppStatus.appLoading;
    update();
    await _commentaireService.getAllCommentForProduit(
        idProduit: idProduit!.toString(),
        onSuccess: (data) {
          commentaires = data.commentaires;
          commentairesStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Error", message: e.response!.data["message"].toString());
          commentairesStatus = AppStatus.appFailure;
          update();
        });
  }

  Future saveCommentForProduit() async {
    if ((textEditingCommentaire.text.isEmpty)) {
      AppSnackBar.show(title: "Erreur", message: "Commentaire trop court !", backColor:  Colors.red);
      return;
    }
    sendStatus = AppStatus.appLoading;
    update();
    await _commentaireService.saveCommentForProduit(
        idProduit: idProduit!.toString(),
        data: {
          "contenu": textEditingCommentaire.text.trim(),
        },
        onSuccess: (data) {
          commentaires = [Commentaire(username:  "Moi...", contenu: textEditingCommentaire.text.trim(), createdAt: DateTime.now()), ...commentaires!];
          textEditingCommentaire.text = "";
          sendStatus = AppStatus.appSuccess;
          update();
        },
        onError: (e) {
          AppSnackBar.show(
              title: "Error", message: e.response!.data["message"].toString());
          sendStatus = AppStatus.appFailure;
          update();
        });
  }

}