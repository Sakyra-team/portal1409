import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:portal1409/repository/auth/login_repository_abstract.dart';

final secureStorage = FlutterSecureStorage();

class LoginRepository implements LoginRepositoryAbstract {
  @override
  Future<void> saveTokens(String session, String rememberToken) async {
    await secureStorage.write(key: "session", value: session);
    await secureStorage.write(key: "remember_token", value: rememberToken);
  }

  @override
  Future<void> logout() async {
    await secureStorage.delete(key: "session");
    await secureStorage.delete(key: "remember_token");
  }

  @override
  Future<String?> getSession() async {
    final String? session = await secureStorage.read(key: "session");
    return session;
  }

  @override
  Future<String?> getRememberToken() async {
    final String? rememberToken = await secureStorage.read(key: "remember_token");
    return rememberToken;
  }

  @override
  Future<bool> isAuth() async {
    final String? token = await secureStorage.read(key: "session");
    final String? rememberToken = await secureStorage.read(key: "remember_token");
    if (token != null && rememberToken != null) {
      return true;
    }
    return false;
  }
}
