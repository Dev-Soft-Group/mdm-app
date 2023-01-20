

import 'package:get/get.dart';
import 'package:mdmscoops/screens/contacts/controllers/contact_controller.dart';

class ContactsBinding implements Bindings{

  @override
  void dependencies(){
    Get.lazyPut<ContactsController>(() => ContactsController());
  }
}