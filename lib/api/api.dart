import 'package:retrofit/retrofit.dart';
import 'package:portal1409/api/models/models.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

// const domainName = "http://10.0.2.2:1409/api";
// const String domainName = "https://my1409.ru/api";
// const domainName = "http://192.168.1.75:1409/api";
// const String domainName = "http://10.225.167.3:1409/api";

@RestApi(baseUrl: "http://10.225.167.3:1409/api")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  // ----------------
  // Auth application
  // ----------------

  @POST('/teacher/login/phone-send') // enter sms code
  Future<SendPhone> sendPhone(@Body() Map<String, String> body);
  /*
  input data:
    {
      "phone": "phone"
    }
  output data:
    {'status': 'error', 'message': 'teacher not found'}, 404
    {'status': 'error', 'message': 'error sending code'}, 400
    {'status': 'success'}, 200
  */

  @POST("/teacher/login/phone-check") // check sms code
  Future<CheckCode> checkCode(@Body() Map<String, String> body);
  /*
  input data:
    {
      "phone": "phone",
      "code": "code"
    }
  output data:
    {'status': 'error', 'message': 'wrong code'}, 401
    {'status': 'error', 'message': 'teacher not found'}, 404
    {'status': 'success'}, 200
  */

  @GET("/teacher") // get teacher info
  Future<Teacher> teacherInfo();
  /*
  output data:
    {
      'name': f'{current_user.surname} {current_user.name} {current_user.lastname}',
      'default_group_number': current_user.default_group_number,
      'default_group_letter': current_user.default_group_letter,
      'login': current_user.login,
      'block_class_exit': current_user.block_class_exit,
      'campus': current_user.campus,
      'card': card_status
    }
  */

  @POST("/teacher") // edit teacher info
  Future<EditTeacher> editTeacherInfo();
  /*
  input data:
    {
      'name': f'{current_user.surname} {current_user.name} {current_user.lastname}',
      'default_group_number': current_user.default_group_number,
      'default_group_letter': current_user.default_group_letter,
      'login': current_user.login,
      'block_class_exit': current_user.block_class_exit,
      'campus': current_user.campus,
      'card': card_status
    }
  output data:
    {'status': 'success'}, 200
  */

  // ----------------
  // Lfit application
  // ----------------

  @POST('/lift/1')
  Future<Lift> lift1();

  @POST('/lift/2')
  Future<Lift> lift2();

  @POST('/lift/3')
  Future<Lift> lift3();

  @POST('/lift/4')
  Future<Lift> lift4();

  // ----------------
  // Exit application
  // ----------------

  @POST("/teacher/exit_application") // Create exit application
  Future<CreateExitApplication> createExitApplication(
    @Body()
    Map<String, String> body, // fio, group number, group letter, cause, time
  );
  /*
  input data:
    {
      "fio": "Фамилия Имя Отчество",
      "group_number": "9",
      "group_letter": "А",
      "cause": "Причина выхода",
      "time": "14:30"
    }
  output data:
    {
      "status": "success",
      "application_id": "uuid",
      "code": "1234"
    }
    {'status': 'error', 'message': 'Вы не можете создавать заявки для этого корпуса'}
    {'status': 'error', 'message': 'Выход для этого класса запрещен классным руководителем'}
  */

  @GET("/teacher/history") // Get exit application histroy
  Future<List<HistoryExitAppInfo>> getExitAppHistory(@Query("all") bool? isAll,);
  /*
  output data:
  [{
    "cause": "Семейные обстоятельства",
    "created_at": "Sun, 30 Nov 2025 19:41:11 GMT",
    "group": "8Б",
    "id": "bc780762-e12b-411a-8291-ab2f7ab2cf74",
    "is_deleted": false,
    "is_show": true,
    "name": "Тестов Тест",
    "teacher_name": "ser",
    "used_at": null
  }]
  */
}
