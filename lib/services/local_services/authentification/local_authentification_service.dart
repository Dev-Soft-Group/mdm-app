abstract class LocalAuthService {
  Future<bool> saveToken(String token);
  Future<bool> saveUser(String user);
  Future<bool> hasAuthenticate();
  Future<String?> getToken();
  Future<String?> getUser();
  Future<bool> deleteToken();
}