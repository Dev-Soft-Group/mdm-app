
abstract class EntrepriseService {
  Future<void> getAllEntreprises({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> getAllEntreprisesForUser({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addEntreprise({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
  
  Future<void> addSuccursale({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}