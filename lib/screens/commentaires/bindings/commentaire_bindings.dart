

import 'package:get/get.dart';
import 'package:mdmscoops/screens/commentaires/controllers/commentaire_produit_controller.dart';
import 'package:mdmscoops/screens/commentaires/controllers/commentaire_publication_controller.dart';

class CommentaireBinding implements Bindings{

  @override
  void dependencies(){
    
    Get.lazyPut<CommentaireProduitController>(() => CommentaireProduitController());

    Get.lazyPut<CommentairePublicationController>(() => CommentairePublicationController());
  }
}