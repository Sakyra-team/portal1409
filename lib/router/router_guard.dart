import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:portal1409/repository/auth/login_repository.dart';

class AuthGuard extends AutoRouteGuard {
  const AuthGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {

    final bool isAuthenticated = await GetIt.I<LoginRepository>().isAuth();
    if (isAuthenticated) {
      // Если пользователь авторизован, разрешаем навигацию
      resolver.next(true);
    } else {
      // Если не авторизован, перенаправляем на логин
      router.pushPath("/login");
    }
  }
}
