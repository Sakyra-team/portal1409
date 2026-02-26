abstract interface class LoginrepositoryInterface {
  Future<void> saveTokens(String session, String rememberToken);
  Future<void> logout();
  Future<String?> getSession();
  Future<String?> getRememberToken();
  Future<bool> isAuth();
}
