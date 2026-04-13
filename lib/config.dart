part of 'main.dart';

class DioInterceptor extends Interceptor {
  final LoginRepository loginManager;
  final Dio dio;

  DioInterceptor(this.loginManager, this.dio);

  static const _authFreePaths = {
    '/teacher/login/phone-send',
    '/teacher/login/phone-check',
  };

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 🔓 эндпоинты без авторизации
    if (_authFreePaths.contains(options.path)) {
      return handler.next(options);
    }

    final String? token = await loginManager.getSession();
    final String? rememberToken = await loginManager.getRememberToken();

    if (token != null && rememberToken != null) {
      // options.headers["remember_token"] = rememberToken;
      // options.headers["session"] = token;
      options.headers["Cookie"] =
          "remember_token=$rememberToken;session=$token;";
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final cookies = response.headers['set-cookie'];

    if (cookies != null) {
      String? session;
      String? rememberToken;

      for (final cookie in cookies) {
        if (cookie.startsWith('session=')) {
          session = cookie.split(';').first.split('=').last;
        }
        if (cookie.startsWith('remember_token=')) {
          rememberToken = cookie.split(';').first.split('=').last;
        }
      }

      if (session != null && rememberToken != null) {
        await loginManager.saveTokens(session, rememberToken);
      }
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 500 || err.response?.statusCode == 502) {
      showSnack("Ошибка на стороне сервера");
    } else {
      if (err.type == DioExceptionType.connectionError) {
        showSnack("Нет интернета");
      } else if (err.type == DioExceptionType.connectionTimeout) {
        showSnack("Время ожидания истекло");
      }

      handler.next(err);
    }
  }
}

final GetIt getIt = GetIt.instance;
final LoginRepository loginManager = LoginRepository();
final Dio dio = Dio(
  BaseOptions(
    validateStatus: (status) {
      return true;
    },
  ),
);
final ApiClient apiClient = ApiClient(dio);
// final talker = Talker();

Future<void> loadConfig() async {
  // dio.interceptors.add(
  //   TalkerDioLogger(
  //     talker: talker,
  //     settings: const TalkerDioLoggerSettings(
  //       printRequestHeaders: true,
  //       printResponseHeaders: true,
  //       printResponseMessage: true,
  //     ),
  //   ),
  // );

  dio.interceptors.add(DioInterceptor(loginManager, dio));

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final ServiceRepository serviceRepository = ServiceRepository(prefs: prefs);

  getIt.registerLazySingleton<ApiClient>(() => apiClient);
  getIt.registerLazySingleton<LoginRepository>(() => loginManager);
  getIt.registerLazySingleton<ServiceRepository>(() => serviceRepository);
}
