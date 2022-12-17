abstract class LocalAuthService {
  Future<bool> saveToken(String token);
  Future<bool> saveEntrepriseId(String idEntreprise);
  Future<bool> saveUser(String user);
  Future<bool> hasAuthenticate();
  Future<String?> getToken();
  Future<String?> getEntrepriseId();
  Future<String?> getUser();
  Future<bool> deleteToken();
}