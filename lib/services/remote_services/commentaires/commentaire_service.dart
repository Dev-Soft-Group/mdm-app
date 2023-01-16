


import 'package:mdmscoops/models/response_model/commentaire_model.dart';

abstract class CommentairesService {
  Future<void> getAllCommentForPublication({
    String? idPublication,
    Function(CommentaireResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

   Future<void> getAllCommentForProduct({
    String? idProduct,
    Function(CommentaireResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

 
}