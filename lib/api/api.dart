import 'package:portal1409/api/models/get_event.dart';
import 'package:portal1409/main.dart';
import 'package:retrofit/retrofit.dart';
import 'package:portal1409/api/models/models.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  // ----------------
  // Auth application
  // ----------------

  @POST("/api/teacher/login/phone-send") // enter sms code
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

  @POST("/api/teacher/login/phone-check") // check sms code
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

  @GET("/api/teacher") // get teacher info
  Future<Teacher> teacherInfo();
  /*
  output data:
    {
      "block_class_exit": false,
      "campus": "modern",
      "card": null,
      "default_group_letter": "Я",
      "default_group_number": 8,
      "login": "sakyra568@gmail.com",
      "name": "Sakyra ser sakquer",
      "show_contact_to_colleagues": null
      "birth_date": null,
      "extra_info": null,
    }
  */

  @POST("/api/teacher") // edit teacher info
  Future<EditTeacher> editTeacherInfo(@Body() Map<String, dynamic> body);
  /*
  input data:
    {
      "birth_date": "02.07",
      "block_class_exit": true,
      "campus": "modern",
      "card": null,
      "default_group_letter": "Я",
      "default_group_number": 8,
      "extra_info": "",
      "login": "sakyra568@gmail.com",
      "name": "Sakyra ser sakquer",
      "show_contact_to_colleagues": null
    }
  output data:
    {'status': 'success'}, 200
  */

  @GET("/api/teacher/registration-link")
  Future<RegisterLink> getRegisterStudentLink();

  // ----------------
  // Lfit application
  // ----------------

  @POST("/api/lift/1")
  Future<Lift> lift1();

  @POST("/api/lift/2")
  Future<Lift> lift2();

  @POST("/api/lift/3")
  Future<Lift> lift3();

  @POST("/api/lift/4")
  Future<Lift> lift4();

  // ----------------
  // Exit application
  // ----------------

  @POST("/api/teacher/exit_application") // Create exit application
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

  @GET("/api/teacher/history") // Get exit application histroy
  Future<List<HistoryExitAppInfo>> getExitAppHistory(@Query("all") bool? isAll);
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

  @POST("/api/teacher/exit_application/{uuid}/close/")
  Future<ExitClose> closeExitApplication(@Path() String uuid);
  /*
  output data:
  {'status': 'success'}
  {'status': 'error', 'message': 'application not found'}
  */

  // ------
  // Events
  // ------

  @GET("/events/api/get_events")
  Future<List<GetEvent>> getEvents();
  /*
  output data:
  [{
    "id": id,
    'event_name': event.name,
    'date': event.date,
    'time': event.time,
    'description': event.description,
    'location': event.location,
    'is_online': event.is_online,
    'conference_link': event.conference_link,
    'is_registration_open': event.is_registration_open
  }]
  */
}
