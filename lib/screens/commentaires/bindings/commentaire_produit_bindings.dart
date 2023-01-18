

import 'package:get/get.dart';
import 'package:mdmscoops/screens/commentaires/controllers/commentaire_produit_controller.dart';

class CommentaireProduitBinding implements Bindings{

  @override
  void dependencies(){
    
    Get.lazyPut<CommentaireProduitController>(() => CommentaireProduitController());
  }
}