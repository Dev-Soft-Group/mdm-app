

import 'package:get/get.dart';
import 'package:mdmscoops/screens/commentaires/controllers/commentaire_publication_controller.dart';

class CommentairePublicationBinding implements Bindings{

  @override
  void dependencies(){

    Get.lazyPut<CommentairePublicationController>(() => CommentairePublicationController());
  }
}